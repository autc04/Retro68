// icf.h --  Identical Code Folding

// Copyright 2009 Free Software Foundation, Inc.
// Written by Sriraman Tallam <tmsriram@google.com>.

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

#ifndef GOLD_ICF_H
#define GOLD_ICF_H

#include <vector>

#include "elfcpp.h"
#include "symtab.h"

namespace gold
{

class Object;
class Input_objects;
class Symbol_table;

typedef std::pair<Object*, unsigned int> Section_id;

class Icf
{
 public:
  struct Section_id_hash
  {
    size_t operator()(const Section_id& loc) const
    { return reinterpret_cast<uintptr_t>(loc.first) ^ loc.second; }
  };

  typedef std::vector<Section_id> Sections_reachable_list;
  typedef std::vector<Symbol*> Symbol_info;
  typedef std::vector<std::pair<long long, long long> > Addend_info;
  typedef Unordered_map<Section_id,
                        Sections_reachable_list,
                        Section_id_hash> Section_list;
  typedef Unordered_map<Section_id, Symbol_info, Section_id_hash> Symbol_list;
  typedef Unordered_map<Section_id, Addend_info, Section_id_hash> Addend_list;
  typedef Unordered_map<Section_id,
                        unsigned int,
                        Section_id_hash> Uniq_secn_id_map;

  Icf()
  : id_section_(), section_id_(), kept_section_id_(),
    num_tracked_relocs(NULL), icf_ready_(false),
    section_reloc_list_(), symbol_reloc_list_(),
    addend_reloc_list_()
  { }

  // Returns the kept folded identical section corresponding to
  // dup_obj and dup_shndx.
  Section_id
  get_folded_section(Object* dup_obj, unsigned int dup_shndx);

  // Forms groups of identical sections where the first member
  // of each group is the kept section during folding.
  void
  find_identical_sections(const Input_objects* input_objects,
                          Symbol_table* symtab);

  // This is set when ICF has been run and the groups of
  // identical sections have been formed.
  void
  icf_ready()
  { this->icf_ready_ = true; }

  // Returns true if ICF has been run.
  bool
  is_icf_ready()
  { return this->icf_ready_; }

  // Unfolds the section denoted by OBJ and SHNDX if folded.
  void
  unfold_section(Object* obj, unsigned int shndx);

  // Returns the kept section corresponding to the 
  // given section.
  bool
  is_section_folded(Object* obj, unsigned int shndx);
    
  // Returns a map of a section to a list of all sections referenced
  // by its relocations.
  Section_list&
  section_reloc_list()
  { return this->section_reloc_list_; }

  // Returns a map of  a section to a list of all symbols referenced
  // by its relocations.
  Symbol_list&
  symbol_reloc_list()
  { return this->symbol_reloc_list_; }

  // Returns a maps of a section to a list of symbol values and addends
  // of its relocations.
  Addend_list&
  addend_reloc_list()
  { return this->addend_reloc_list_; }
  
  // Returns a mapping of each section to a unique integer.
  Uniq_secn_id_map&
  section_to_int_map()
  { return this->section_id_; }

 private:

  // Maps integers to sections.
  std::vector<Section_id> id_section_;
  // Does the reverse.
  Uniq_secn_id_map section_id_;
  // Given a section id, this maps it to the id of the kept
  // section.  If the id's are the same then this section is
  // not folded.
  std::vector<unsigned int> kept_section_id_;
  unsigned int* num_tracked_relocs;
  // Flag to indicate if ICF has been run.
  bool icf_ready_;

  // These lists are populated by gc_process_relocs in gc.h.
  Section_list section_reloc_list_;
  Symbol_list symbol_reloc_list_;
  Addend_list addend_reloc_list_;
};

} // End of namespace gold.

#endif
