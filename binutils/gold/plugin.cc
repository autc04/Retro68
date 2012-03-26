// plugin.cc -- plugin manager for gold      -*- C++ -*-

// Copyright 2008, 2009 Free Software Foundation, Inc.
// Written by Cary Coutant <ccoutant@google.com>.

// This file is part of gold.

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
// MA 02110-1301, USA.

#include "gold.h"

#include <cstdio>
#include <cstdarg>
#include <cstring>
#include <string>
#include <vector>

#ifdef ENABLE_PLUGINS
#include <dlfcn.h>
#endif

#include "parameters.h"
#include "errors.h"
#include "fileread.h"
#include "layout.h"
#include "options.h"
#include "plugin.h"
#include "target.h"
#include "readsyms.h"
#include "symtab.h"
#include "elfcpp.h"

namespace gold
{

#ifdef ENABLE_PLUGINS

// The linker's exported interfaces.

extern "C"
{

static enum ld_plugin_status
register_claim_file(ld_plugin_claim_file_handler handler);

static enum ld_plugin_status
register_all_symbols_read(ld_plugin_all_symbols_read_handler handler);

static enum ld_plugin_status
register_cleanup(ld_plugin_cleanup_handler handler);

static enum ld_plugin_status
add_symbols(void *handle, int nsyms, const struct ld_plugin_symbol *syms);

static enum ld_plugin_status
get_input_file(const void *handle, struct ld_plugin_input_file *file);

static enum ld_plugin_status
release_input_file(const void *handle);

static enum ld_plugin_status
get_symbols(const void *handle, int nsyms, struct ld_plugin_symbol *syms);

static enum ld_plugin_status
add_input_file(char *pathname);

static enum ld_plugin_status
add_input_library(char *pathname);

static enum ld_plugin_status
message(int level, const char *format, ...);

};

#endif // ENABLE_PLUGINS

static Pluginobj* make_sized_plugin_object(Input_file* input_file,
                                           off_t offset, off_t filesize);

// Plugin methods.

// Load one plugin library.

void
Plugin::load()
{
#ifdef ENABLE_PLUGINS
  // Load the plugin library.
  // FIXME: Look for the library in standard locations.
  this->handle_ = dlopen(this->filename_.c_str(), RTLD_NOW);
  if (this->handle_ == NULL)
    {
      gold_error(_("%s: could not load plugin library"),
                 this->filename_.c_str());
      return;
    }

  // Find the plugin's onload entry point.
  ld_plugin_onload onload = reinterpret_cast<ld_plugin_onload>
    (dlsym(this->handle_, "onload"));
  if (onload == NULL)
    {
      gold_error(_("%s: could not find onload entry point"),
                 this->filename_.c_str());
      return;
    }

  // Get the linker's version number.
  const char* ver = get_version_string();
  int major = 0;
  int minor = 0;
  sscanf(ver, "%d.%d", &major, &minor);

  // Allocate and populate a transfer vector.
  const int tv_fixed_size = 14;
  int tv_size = this->args_.size() + tv_fixed_size;
  ld_plugin_tv *tv = new ld_plugin_tv[tv_size];

  // Put LDPT_MESSAGE at the front of the list so the plugin can use it
  // while processing subsequent entries.
  int i = 0;
  tv[i].tv_tag = LDPT_MESSAGE;
  tv[i].tv_u.tv_message = message;

  ++i;
  tv[i].tv_tag = LDPT_API_VERSION;
  tv[i].tv_u.tv_val = LD_PLUGIN_API_VERSION;

  ++i;
  tv[i].tv_tag = LDPT_GOLD_VERSION;
  tv[i].tv_u.tv_val = major * 100 + minor;

  ++i;
  tv[i].tv_tag = LDPT_LINKER_OUTPUT;
  if (parameters->options().relocatable())
    tv[i].tv_u.tv_val = LDPO_REL;
  else if (parameters->options().shared())
    tv[i].tv_u.tv_val = LDPO_DYN;
  else
    tv[i].tv_u.tv_val = LDPO_EXEC;

  for (unsigned int j = 0; j < this->args_.size(); ++j)
    {
      ++i;
      tv[i].tv_tag = LDPT_OPTION;
      tv[i].tv_u.tv_string = this->args_[j].c_str();
    }

  ++i;
  tv[i].tv_tag = LDPT_REGISTER_CLAIM_FILE_HOOK;
  tv[i].tv_u.tv_register_claim_file = register_claim_file;

  ++i;
  tv[i].tv_tag = LDPT_REGISTER_ALL_SYMBOLS_READ_HOOK;
  tv[i].tv_u.tv_register_all_symbols_read = register_all_symbols_read;

  ++i;
  tv[i].tv_tag = LDPT_REGISTER_CLEANUP_HOOK;
  tv[i].tv_u.tv_register_cleanup = register_cleanup;

  ++i;
  tv[i].tv_tag = LDPT_ADD_SYMBOLS;
  tv[i].tv_u.tv_add_symbols = add_symbols;

  ++i;
  tv[i].tv_tag = LDPT_GET_INPUT_FILE;
  tv[i].tv_u.tv_get_input_file = get_input_file;

  ++i;
  tv[i].tv_tag = LDPT_RELEASE_INPUT_FILE;
  tv[i].tv_u.tv_release_input_file = release_input_file;

  ++i;
  tv[i].tv_tag = LDPT_GET_SYMBOLS;
  tv[i].tv_u.tv_get_symbols = get_symbols;

  ++i;
  tv[i].tv_tag = LDPT_ADD_INPUT_FILE;
  tv[i].tv_u.tv_add_input_file = add_input_file;

  ++i;
  tv[i].tv_tag = LDPT_ADD_INPUT_LIBRARY;
  tv[i].tv_u.tv_add_input_library = add_input_library;

  ++i;
  tv[i].tv_tag = LDPT_NULL;
  tv[i].tv_u.tv_val = 0;

  gold_assert(i == tv_size - 1);

  // Call the onload entry point.
  (*onload)(tv);

  delete[] tv;
#endif // ENABLE_PLUGINS
}

// Call the plugin claim-file handler.

inline bool
Plugin::claim_file(struct ld_plugin_input_file *plugin_input_file)
{
  int claimed = 0;

  if (this->claim_file_handler_ != NULL)
    {
      (*this->claim_file_handler_)(plugin_input_file, &claimed);
      if (claimed)
        return true;
    }
  return false;
}

// Call the all-symbols-read handler.

inline void
Plugin::all_symbols_read()
{
  if (this->all_symbols_read_handler_ != NULL)
    (*this->all_symbols_read_handler_)();
}

// Call the cleanup handler.

inline void
Plugin::cleanup()
{
  if (this->cleanup_handler_ != NULL)
    (*this->cleanup_handler_)();
}

// Plugin_manager methods.

Plugin_manager::~Plugin_manager()
{
  for (Plugin_list::iterator p = this->plugins_.begin();
       p != this->plugins_.end();
       ++p)
    delete *p;
  this->plugins_.clear();
  for (Object_list::iterator obj = this->objects_.begin();
       obj != this->objects_.end();
       ++obj)
    delete *obj;
  this->objects_.clear();
}

// Load all plugin libraries.

void
Plugin_manager::load_plugins()
{
  for (this->current_ = this->plugins_.begin();
       this->current_ != this->plugins_.end();
       ++this->current_)
    (*this->current_)->load();
}

// Call the plugin claim-file handlers in turn to see if any claim the file.

Pluginobj*
Plugin_manager::claim_file(Input_file* input_file, off_t offset,
                           off_t filesize)
{
  if (this->in_replacement_phase_)
    return NULL;

  unsigned int handle = this->objects_.size();
  this->input_file_ = input_file;
  this->plugin_input_file_.name = input_file->filename().c_str();
  this->plugin_input_file_.fd = input_file->file().descriptor();
  this->plugin_input_file_.offset = offset;
  this->plugin_input_file_.filesize = filesize;
  this->plugin_input_file_.handle = reinterpret_cast<void*>(handle);

  for (this->current_ = this->plugins_.begin();
       this->current_ != this->plugins_.end();
       ++this->current_)
    {
      if ((*this->current_)->claim_file(&this->plugin_input_file_))
        {
          if (this->objects_.size() > handle)
            return this->objects_[handle];

          // If the plugin claimed the file but did not call the
          // add_symbols callback, we need to create the Pluginobj now.
          Pluginobj* obj = this->make_plugin_object(handle);
          return obj;
        }
    }

  return NULL;
}

// Call the all-symbols-read handlers.

void
Plugin_manager::all_symbols_read(Workqueue* workqueue, Task* task,
                                 Input_objects* input_objects,
	                         Symbol_table* symtab, Layout* layout,
	                         Dirsearch* dirpath, Mapfile* mapfile,
	                         Task_token** last_blocker)
{
  this->in_replacement_phase_ = true;
  this->workqueue_ = workqueue;
  this->task_ = task;
  this->input_objects_ = input_objects;
  this->symtab_ = symtab;
  this->layout_ = layout;
  this->dirpath_ = dirpath;
  this->mapfile_ = mapfile;
  this->this_blocker_ = NULL;

  for (this->current_ = this->plugins_.begin();
       this->current_ != this->plugins_.end();
       ++this->current_)
    (*this->current_)->all_symbols_read();

  *last_blocker = this->this_blocker_;
}

// Layout deferred objects.

void
Plugin_manager::layout_deferred_objects()
{
  Deferred_layout_list::iterator obj;

  for (obj = this->deferred_layout_objects_.begin();
       obj != this->deferred_layout_objects_.end();
       ++obj)
    (*obj)->layout_deferred_sections(this->layout_);
}

// Call the cleanup handlers.

void
Plugin_manager::cleanup()
{
  if (this->cleanup_done_)
    return;
  for (this->current_ = this->plugins_.begin();
       this->current_ != this->plugins_.end();
       ++this->current_)
    (*this->current_)->cleanup();
  this->cleanup_done_ = true;
}

// Make a new Pluginobj object.  This is called when the plugin calls
// the add_symbols API.

Pluginobj*
Plugin_manager::make_plugin_object(unsigned int handle)
{
  // Make sure we aren't asked to make an object for the same handle twice.
  if (this->objects_.size() != handle)
    return NULL;

  Pluginobj* obj = make_sized_plugin_object(this->input_file_,
                                            this->plugin_input_file_.offset,
                                            this->plugin_input_file_.filesize);
  this->objects_.push_back(obj);
  return obj;
}

// Get the input file information with an open (possibly re-opened)
// file descriptor.

ld_plugin_status
Plugin_manager::get_input_file(unsigned int handle,
                               struct ld_plugin_input_file *file)
{
  Pluginobj* obj = this->object(handle);
  if (obj == NULL)
    return LDPS_BAD_HANDLE;

  obj->lock(this->task_);
  file->name = obj->filename().c_str();
  file->fd = obj->descriptor();
  file->offset = obj->offset();
  file->filesize = obj->filesize();
  file->handle = reinterpret_cast<void*>(handle);
  return LDPS_OK;
}

// Release the input file.

ld_plugin_status
Plugin_manager::release_input_file(unsigned int handle)
{
  Pluginobj* obj = this->object(handle);
  if (obj == NULL)
    return LDPS_BAD_HANDLE;

  obj->unlock(this->task_);
  return LDPS_OK;
}

// Add a new input file.

ld_plugin_status
Plugin_manager::add_input_file(char *pathname, bool is_lib)
{
  Input_file_argument file(pathname,
                           (is_lib
                            ? Input_file_argument::INPUT_FILE_TYPE_LIBRARY
                            : Input_file_argument::INPUT_FILE_TYPE_FILE),
                           "", false, this->options_);
  Input_argument* input_argument = new Input_argument(file);
  Task_token* next_blocker = new Task_token(true);
  next_blocker->add_blocker();
  if (this->layout_->incremental_inputs())
    gold_error(_("Input files added by plug-ins in --incremental mode not "
		 "supported yet.\n"));
  this->workqueue_->queue_soon(new Read_symbols(this->input_objects_,
                                                this->symtab_,
                                                this->layout_,
                                                this->dirpath_,
						0,
                                                this->mapfile_,
                                                input_argument,
                                                NULL,
                                                this->this_blocker_,
                                                next_blocker));
  this->this_blocker_ = next_blocker;
  return LDPS_OK;
}

// Class Pluginobj.

Pluginobj::Pluginobj(const std::string& name, Input_file* input_file,
                     off_t offset, off_t filesize)
  : Object(name, input_file, false, offset),
    nsyms_(0), syms_(NULL), symbols_(), filesize_(filesize), comdat_map_()
{
}

// Return TRUE if a defined symbol might be reachable from outside the
// universe of claimed objects.

static inline bool
is_visible_from_outside(Symbol* lsym)
{
  if (lsym->in_real_elf())
    return true;
  if (parameters->options().relocatable())
    return true;
  if (parameters->options().export_dynamic() || parameters->options().shared())
    return lsym->is_externally_visible();
  return false;
}

// Get symbol resolution info.

ld_plugin_status
Pluginobj::get_symbol_resolution_info(int nsyms, ld_plugin_symbol* syms) const
{
  if (nsyms > this->nsyms_)
    return LDPS_NO_SYMS;
  for (int i = 0; i < nsyms; i++)
    {
      ld_plugin_symbol* isym = &syms[i];
      Symbol* lsym = this->symbols_[i];
      ld_plugin_symbol_resolution res = LDPR_UNKNOWN;

      if (lsym->is_undefined())
        // The symbol remains undefined.
        res = LDPR_UNDEF;
      else if (isym->def == LDPK_UNDEF
               || isym->def == LDPK_WEAKUNDEF
               || isym->def == LDPK_COMMON)
        {
          // The original symbol was undefined or common.
          if (lsym->source() != Symbol::FROM_OBJECT)
            res = LDPR_RESOLVED_EXEC;
          else if (lsym->object()->pluginobj() != NULL)
            res = LDPR_RESOLVED_IR;
          else if (lsym->object()->is_dynamic())
            res = LDPR_RESOLVED_DYN;
          else
            res = LDPR_RESOLVED_EXEC;
        }
      else
        {
          // The original symbol was a definition.
          if (lsym->source() != Symbol::FROM_OBJECT)
            res = LDPR_PREEMPTED_REG;
          else if (lsym->object() == static_cast<const Object*>(this))
            res = (is_visible_from_outside(lsym)
                   ? LDPR_PREVAILING_DEF
                   : LDPR_PREVAILING_DEF_IRONLY);
          else
            res = (lsym->object()->pluginobj() != NULL
                   ? LDPR_PREEMPTED_IR
                   : LDPR_PREEMPTED_REG);
        }
      isym->resolution = res;
    }
  return LDPS_OK;
}

// Return TRUE if the comdat group with key COMDAT_KEY from this object
// should be kept.

bool
Pluginobj::include_comdat_group(std::string comdat_key, Layout* layout)
{
  std::pair<Comdat_map::iterator, bool> ins =
    this->comdat_map_.insert(std::make_pair(comdat_key, false));

  // If this is the first time we've seen this comdat key, ask the
  // layout object whether it should be included.
  if (ins.second)
    ins.first->second = layout->find_or_add_kept_section(comdat_key,
							 NULL, 0, true,
							 true, NULL);

  return ins.first->second;
}

// Class Sized_pluginobj.

template<int size, bool big_endian>
Sized_pluginobj<size, big_endian>::Sized_pluginobj(
    const std::string& name,
    Input_file* input_file,
    off_t offset,
    off_t filesize)
  : Pluginobj(name, input_file, offset, filesize)
{
}

// Read the symbols.  Not used for plugin objects.

template<int size, bool big_endian>
void
Sized_pluginobj<size, big_endian>::do_read_symbols(Read_symbols_data*)
{
  gold_unreachable();
}

// Lay out the input sections.  Not used for plugin objects.

template<int size, bool big_endian>
void
Sized_pluginobj<size, big_endian>::do_layout(Symbol_table*, Layout*,
                                             Read_symbols_data*)
{
  gold_unreachable();
}

// Add the symbols to the symbol table.

template<int size, bool big_endian>
void
Sized_pluginobj<size, big_endian>::do_add_symbols(Symbol_table* symtab,
                                                  Read_symbols_data*,
                                                  Layout* layout)
{
  const int sym_size = elfcpp::Elf_sizes<size>::sym_size;
  unsigned char symbuf[sym_size];
  elfcpp::Sym<size, big_endian> sym(symbuf);
  elfcpp::Sym_write<size, big_endian> osym(symbuf);

  typedef typename elfcpp::Elf_types<size>::Elf_WXword Elf_size_type;

  this->symbols_.resize(this->nsyms_);

  for (int i = 0; i < this->nsyms_; ++i)
    {
      const struct ld_plugin_symbol *isym = &this->syms_[i];
      const char* name = isym->name;
      const char* ver = isym->version;
      elfcpp::Elf_Half shndx;
      elfcpp::STB bind;
      elfcpp::STV vis;

      if (name != NULL && name[0] == '\0')
        name = NULL;
      if (ver != NULL && ver[0] == '\0')
        ver = NULL;

      switch (isym->def)
        {
        case LDPK_WEAKDEF:
        case LDPK_WEAKUNDEF:
          bind = elfcpp::STB_WEAK;
          break;
        case LDPK_DEF:
        case LDPK_UNDEF:
        case LDPK_COMMON:
        default:
          bind = elfcpp::STB_GLOBAL;
          break;
        }

      switch (isym->def)
        {
        case LDPK_DEF:
        case LDPK_WEAKDEF:
          shndx = elfcpp::SHN_ABS;
          break;
        case LDPK_COMMON:
          shndx = elfcpp::SHN_COMMON;
          break;
        case LDPK_UNDEF:
        case LDPK_WEAKUNDEF:
        default:
          shndx = elfcpp::SHN_UNDEF;
          break;
        }

      switch (isym->visibility)
        {
        case LDPV_PROTECTED:
          vis = elfcpp::STV_DEFAULT;
          break;
        case LDPV_INTERNAL:
          vis = elfcpp::STV_DEFAULT;
          break;
        case LDPV_HIDDEN:
          vis = elfcpp::STV_DEFAULT;
          break;
        case LDPV_DEFAULT:
        default:
          vis = elfcpp::STV_DEFAULT;
          break;
        }

      if (isym->comdat_key != NULL
          && isym->comdat_key[0] != '\0'
          && !this->include_comdat_group(isym->comdat_key, layout))
        shndx = elfcpp::SHN_UNDEF;

      osym.put_st_name(0);
      osym.put_st_value(0);
      osym.put_st_size(static_cast<Elf_size_type>(isym->size));
      osym.put_st_info(bind, elfcpp::STT_NOTYPE);
      osym.put_st_other(vis, 0);
      osym.put_st_shndx(shndx);

      this->symbols_[i] =
        symtab->add_from_pluginobj<size, big_endian>(this, name, ver, &sym);
    }
}

// Get the size of a section.  Not used for plugin objects.

template<int size, bool big_endian>
uint64_t
Sized_pluginobj<size, big_endian>::do_section_size(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Get the name of a section.  Not used for plugin objects.

template<int size, bool big_endian>
std::string
Sized_pluginobj<size, big_endian>::do_section_name(unsigned int)
{
  gold_unreachable();
  return std::string();
}

// Return a view of the contents of a section.  Not used for plugin objects.

template<int size, bool big_endian>
Object::Location
Sized_pluginobj<size, big_endian>::do_section_contents(unsigned int)
{
  Location loc(0, 0);

  gold_unreachable();
  return loc;
}

// Return section flags.  Not used for plugin objects.

template<int size, bool big_endian>
uint64_t
Sized_pluginobj<size, big_endian>::do_section_flags(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return section entsize.  Not used for plugin objects.

template<int size, bool big_endian>
uint64_t
Sized_pluginobj<size, big_endian>::do_section_entsize(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return section address.  Not used for plugin objects.

template<int size, bool big_endian>
uint64_t
Sized_pluginobj<size, big_endian>::do_section_address(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return section type.  Not used for plugin objects.

template<int size, bool big_endian>
unsigned int
Sized_pluginobj<size, big_endian>::do_section_type(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return the section link field.  Not used for plugin objects.

template<int size, bool big_endian>
unsigned int
Sized_pluginobj<size, big_endian>::do_section_link(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return the section link field.  Not used for plugin objects.

template<int size, bool big_endian>
unsigned int
Sized_pluginobj<size, big_endian>::do_section_info(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return the section alignment.  Not used for plugin objects.

template<int size, bool big_endian>
uint64_t
Sized_pluginobj<size, big_endian>::do_section_addralign(unsigned int)
{
  gold_unreachable();
  return 0;
}

// Return the Xindex structure to use.  Not used for plugin objects.

template<int size, bool big_endian>
Xindex*
Sized_pluginobj<size, big_endian>::do_initialize_xindex()
{
  gold_unreachable();
  return NULL;
}

// Get symbol counts.  Not used for plugin objects.

template<int size, bool big_endian>
void
Sized_pluginobj<size, big_endian>::do_get_global_symbol_counts(const Symbol_table*,
                                                   size_t*, size_t*) const
{
  gold_unreachable();
}

// Class Plugin_finish.  This task runs after all replacement files have
// been added.  It calls each plugin's cleanup handler.

class Plugin_finish : public Task
{
 public:
  Plugin_finish(Task_token* this_blocker, Task_token* next_blocker)
    : this_blocker_(this_blocker), next_blocker_(next_blocker)
  { }

  ~Plugin_finish()
  {
    if (this->this_blocker_ != NULL)
      delete this->this_blocker_;
  }

  Task_token*
  is_runnable()
  {
    if (this->this_blocker_ != NULL && this->this_blocker_->is_blocked())
      return this->this_blocker_;
    return NULL;
  }

  void
  locks(Task_locker* tl)
  { tl->add(this, this->next_blocker_); }

  void
  run(Workqueue*)
  {
    Plugin_manager* plugins = parameters->options().plugins();
    gold_assert(plugins != NULL);
    plugins->cleanup();
  }

  std::string
  get_name() const
  { return "Plugin_finish"; }

 private:
  Task_token* this_blocker_;
  Task_token* next_blocker_;
};

// Class Plugin_hook.

Plugin_hook::~Plugin_hook()
{
}

// Return whether a Plugin_hook task is runnable.

Task_token*
Plugin_hook::is_runnable()
{
  if (this->this_blocker_ != NULL && this->this_blocker_->is_blocked())
    return this->this_blocker_;
  return NULL;
}

// Return a Task_locker for a Plugin_hook task.  We don't need any
// locks here.

void
Plugin_hook::locks(Task_locker*)
{
}

// Run the "all symbols read" plugin hook.

void
Plugin_hook::run(Workqueue* workqueue)
{
  gold_assert(this->options_.has_plugins());
  this->options_.plugins()->all_symbols_read(workqueue,
                                             this,
                                             this->input_objects_,
                                             this->symtab_,
                                             this->layout_,
                                             this->dirpath_,
                                             this->mapfile_,
                                             &this->this_blocker_);
  workqueue->queue_soon(new Plugin_finish(this->this_blocker_,
					  this->next_blocker_));
}

// The C interface routines called by the plugins.

#ifdef ENABLE_PLUGINS

// Register a claim-file handler.

static enum ld_plugin_status
register_claim_file(ld_plugin_claim_file_handler handler)
{
  gold_assert(parameters->options().has_plugins());
  parameters->options().plugins()->set_claim_file_handler(handler);
  return LDPS_OK;
}

// Register an all-symbols-read handler.

static enum ld_plugin_status
register_all_symbols_read(ld_plugin_all_symbols_read_handler handler)
{
  gold_assert(parameters->options().has_plugins());
  parameters->options().plugins()->set_all_symbols_read_handler(handler);
  return LDPS_OK;
}

// Register a cleanup handler.

static enum ld_plugin_status
register_cleanup(ld_plugin_cleanup_handler handler)
{
  gold_assert(parameters->options().has_plugins());
  parameters->options().plugins()->set_cleanup_handler(handler);
  return LDPS_OK;
}

// Add symbols from a plugin-claimed input file.

static enum ld_plugin_status
add_symbols(void* handle, int nsyms, const ld_plugin_symbol *syms)
{
  gold_assert(parameters->options().has_plugins());
  Pluginobj* obj = parameters->options().plugins()->make_plugin_object(
      static_cast<unsigned int>(reinterpret_cast<intptr_t>(handle)));
  if (obj == NULL)
    return LDPS_ERR;
  obj->store_incoming_symbols(nsyms, syms);
  return LDPS_OK;
}

// Get the input file information with an open (possibly re-opened)
// file descriptor.

static enum ld_plugin_status
get_input_file(const void *handle, struct ld_plugin_input_file *file)
{
  gold_assert(parameters->options().has_plugins());
  unsigned int obj_index =
      static_cast<unsigned int>(reinterpret_cast<intptr_t>(handle));
  return parameters->options().plugins()->get_input_file(obj_index, file);
}

// Release the input file.

static enum ld_plugin_status
release_input_file(const void *handle)
{
  gold_assert(parameters->options().has_plugins());
  unsigned int obj_index =
      static_cast<unsigned int>(reinterpret_cast<intptr_t>(handle));
  return parameters->options().plugins()->release_input_file(obj_index);
}

// Get the symbol resolution info for a plugin-claimed input file.

static enum ld_plugin_status
get_symbols(const void * handle, int nsyms, ld_plugin_symbol* syms)
{
  gold_assert(parameters->options().has_plugins());
  Pluginobj* obj = parameters->options().plugins()->object(
      static_cast<unsigned int>(reinterpret_cast<intptr_t>(handle)));
  if (obj == NULL)
    return LDPS_ERR;
  return obj->get_symbol_resolution_info(nsyms, syms);
}

// Add a new (real) input file generated by a plugin.

static enum ld_plugin_status
add_input_file(char *pathname)
{
  gold_assert(parameters->options().has_plugins());
  return parameters->options().plugins()->add_input_file(pathname, false);
}

// Add a new (real) library required by a plugin.

static enum ld_plugin_status
add_input_library(char *pathname)
{
  gold_assert(parameters->options().has_plugins());
  return parameters->options().plugins()->add_input_file(pathname, true);
}

// Issue a diagnostic message from a plugin.

static enum ld_plugin_status
message(int level, const char * format, ...)
{
  va_list args;
  va_start(args, format);

  switch (level)
    {
    case LDPL_INFO:
      parameters->errors()->info(format, args);
      break;
    case LDPL_WARNING:
      parameters->errors()->warning(format, args);
      break;
    case LDPL_ERROR:
    default:
      parameters->errors()->error(format, args);
      break;
    case LDPL_FATAL:
      parameters->errors()->fatal(format, args);
      break;
    }

  va_end(args);
  return LDPS_OK;
}

#endif // ENABLE_PLUGINS

// Allocate a Pluginobj object of the appropriate size and endianness.

static Pluginobj*
make_sized_plugin_object(Input_file* input_file, off_t offset, off_t filesize)
{
  Pluginobj* obj = NULL;

  parameters_force_valid_target();
  const Target& target(parameters->target());

  if (target.get_size() == 32)
    {
      if (target.is_big_endian())
#ifdef HAVE_TARGET_32_BIG
        obj = new Sized_pluginobj<32, true>(input_file->filename(),
                                            input_file, offset, filesize);
#else
        gold_error(_("%s: not configured to support "
		     "32-bit big-endian object"),
		   input_file->filename().c_str());
#endif
      else
#ifdef HAVE_TARGET_32_LITTLE
        obj = new Sized_pluginobj<32, false>(input_file->filename(),
                                             input_file, offset, filesize);
#else
        gold_error(_("%s: not configured to support "
		     "32-bit little-endian object"),
		   input_file->filename().c_str());
#endif
    }
  else if (target.get_size() == 64)
    {
      if (target.is_big_endian())
#ifdef HAVE_TARGET_64_BIG
        obj = new Sized_pluginobj<64, true>(input_file->filename(),
                                            input_file, offset, filesize);
#else
        gold_error(_("%s: not configured to support "
		     "64-bit big-endian object"),
		   input_file->filename().c_str());
#endif
      else
#ifdef HAVE_TARGET_64_LITTLE
        obj = new Sized_pluginobj<64, false>(input_file->filename(),
                                             input_file, offset, filesize);
#else
        gold_error(_("%s: not configured to support "
		     "64-bit little-endian object"),
		   input_file->filename().c_str());
#endif
    }

  gold_assert(obj != NULL);
  return obj;
}

} // End namespace gold.
