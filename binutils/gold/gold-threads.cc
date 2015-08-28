// gold-threads.cc -- thread support for gold

// Copyright 2006, 2007, 2008 Free Software Foundation, Inc.
// Written by Ian Lance Taylor <iant@google.com>.

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

#include <cstring>

#ifdef ENABLE_THREADS
#include <pthread.h>
#endif

#include "options.h"
#include "parameters.h"
#include "gold-threads.h"

namespace gold
{

class Condvar_impl_nothreads;

// The non-threaded version of Lock_impl.

class Lock_impl_nothreads : public Lock_impl
{
 public:
  Lock_impl_nothreads()
    : acquired_(false)
  { }

  ~Lock_impl_nothreads()
  { gold_assert(!this->acquired_); }

  void
  acquire()
  {
    gold_assert(!this->acquired_);
    this->acquired_ = true;
  }

  void
  release()
  {
    gold_assert(this->acquired_);
    this->acquired_ = false;
  }

 private:
  friend class Condvar_impl_nothreads;

  bool acquired_;
};

#ifdef ENABLE_THREADS

class Condvar_impl_threads;

// The threaded version of Lock_impl.

class Lock_impl_threads : public Lock_impl
{
 public:
  Lock_impl_threads();
  ~Lock_impl_threads();

  void acquire();

  void release();

private:
  // This class can not be copied.
  Lock_impl_threads(const Lock_impl_threads&);
  Lock_impl_threads& operator=(const Lock_impl_threads&);

  friend class Condvar_impl_threads;

  pthread_mutex_t mutex_;
};

Lock_impl_threads::Lock_impl_threads()
{
  pthread_mutexattr_t attr;
  int err = pthread_mutexattr_init(&attr);
  if (err != 0)
    gold_fatal(_("pthead_mutextattr_init failed: %s"), strerror(err));
#ifdef PTHREAD_MUTEXT_ADAPTIVE_NP
  err = pthread_mutextattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
  if (err != 0)
    gold_fatal(_("pthread_mutextattr_settype failed: %s"), strerror(err));
#endif

  err = pthread_mutex_init (&this->mutex_, &attr);
  if (err != 0)
    gold_fatal(_("pthread_mutex_init failed: %s"), strerror(err));

  err = pthread_mutexattr_destroy(&attr);
  if (err != 0)
    gold_fatal(_("pthread_mutexattr_destroy failed: %s"), strerror(err));
}

Lock_impl_threads::~Lock_impl_threads()
{
  int err = pthread_mutex_destroy(&this->mutex_);
  if (err != 0)
    gold_fatal(_("pthread_mutex_destroy failed: %s"), strerror(err));
}

void
Lock_impl_threads::acquire()
{
  int err = pthread_mutex_lock(&this->mutex_);
  if (err != 0)
    gold_fatal(_("pthread_mutex_lock failed: %s"), strerror(err));
}

void
Lock_impl_threads::release()
{
  int err = pthread_mutex_unlock(&this->mutex_);
  if (err != 0)
    gold_fatal(_("pthread_mutex_unlock failed: %s"), strerror(err));
}

#endif // defined(ENABLE_THREADS)

// Class Lock.

Lock::Lock()
{
  if (!parameters->options().threads())
    this->lock_ = new Lock_impl_nothreads;
  else
    {
#ifdef ENABLE_THREADS
      this->lock_ = new Lock_impl_threads;
#else
      gold_unreachable();
#endif
    }
}

Lock::~Lock()
{
  delete this->lock_;
}

// The non-threaded version of Condvar_impl.

class Condvar_impl_nothreads : public Condvar_impl
{
 public:
  Condvar_impl_nothreads()
  { }

  ~Condvar_impl_nothreads()
  { }

  void
  wait(Lock_impl* li)
  { gold_assert(static_cast<Lock_impl_nothreads*>(li)->acquired_); }

  void
  signal()
  { }

  void
  broadcast()
  { }
};

#ifdef ENABLE_THREADS

// The threaded version of Condvar_impl.

class Condvar_impl_threads : public Condvar_impl
{
 public:
  Condvar_impl_threads();
  ~Condvar_impl_threads();

  void
  wait(Lock_impl*);

  void
  signal();

  void
  broadcast();

 private:
  // This class can not be copied.
  Condvar_impl_threads(const Condvar_impl_threads&);
  Condvar_impl_threads& operator=(const Condvar_impl_threads&);

  pthread_cond_t cond_;
};

Condvar_impl_threads::Condvar_impl_threads()
{
  int err = pthread_cond_init(&this->cond_, NULL);
  if (err != 0)
    gold_fatal(_("pthread_cond_init failed: %s"), strerror(err));
}

Condvar_impl_threads::~Condvar_impl_threads()
{
  int err = pthread_cond_destroy(&this->cond_);
  if (err != 0)
    gold_fatal(_("pthread_cond_destroy failed: %s"), strerror(err));
}

void
Condvar_impl_threads::wait(Lock_impl* li)
{
  Lock_impl_threads* lit = static_cast<Lock_impl_threads*>(li);
  int err = pthread_cond_wait(&this->cond_, &lit->mutex_);
  if (err != 0)
    gold_fatal(_("pthread_cond_wait failed: %s"), strerror(err));
}

void
Condvar_impl_threads::signal()
{
  int err = pthread_cond_signal(&this->cond_);
  if (err != 0)
    gold_fatal(_("pthread_cond_signal failed: %s"), strerror(err));
}

void
Condvar_impl_threads::broadcast()
{
  int err = pthread_cond_broadcast(&this->cond_);
  if (err != 0)
    gold_fatal(_("pthread_cond_broadcast failed: %s"), strerror(err));
}

#endif // defined(ENABLE_THREADS)

// Methods for Condvar class.

Condvar::Condvar(Lock& lock)
  : lock_(lock)
{
  if (!parameters->options().threads())
    this->condvar_ = new Condvar_impl_nothreads;
  else
    {
#ifdef ENABLE_THREADS
      this->condvar_ = new Condvar_impl_threads;
#else
      gold_unreachable();
#endif
    }
}

Condvar::~Condvar()
{
  delete this->condvar_;
}

#ifdef ENABLE_THREADS

// Class Initialize_lock_once.  This exists to hold a pthread_once_t
// structure for Initialize_lock.

class Initialize_lock_once
{
 public:
  Initialize_lock_once()
    : once_(PTHREAD_ONCE_INIT)
  { }

  // Return a pointer to the pthread_once_t variable.
  pthread_once_t*
  once_control()
  { return &this->once_; }

 private:
  pthread_once_t once_;
};

#endif // !defined(ENABLE_THREADS)

#ifdef ENABLE_THREADS

// A single lock which controls access to initialize_lock_pointer.
// This is used because we can't pass parameters to functions passed
// to pthread_once.

static pthread_mutex_t initialize_lock_control = PTHREAD_MUTEX_INITIALIZER;

// A pointer to a pointer to the lock which we need to initialize
// once.  Access to this is controlled by initialize_lock_control.

static Lock** initialize_lock_pointer;

// A routine passed to pthread_once which initializes the lock which
// initialize_lock_pointer points to.

extern "C"
{

static void
initialize_lock_once()
{
  *initialize_lock_pointer = new Lock();
}

}

#endif // !defined(ENABLE_THREADS)

// Class Initialize_lock.

Initialize_lock::Initialize_lock(Lock** pplock)
  : pplock_(pplock)
{
#ifndef ENABLE_THREADS
  this->once_ = NULL;
#else
  this->once_ = new Initialize_lock_once();
#endif
}

// Initialize the lock.

bool
Initialize_lock::initialize()
{
  // If the lock has already been initialized, we don't need to do
  // anything.  Note that this assumes that the pointer value will be
  // set completely or not at all.  I hope this is always safe.  We
  // want to do this for efficiency.
  if (*this->pplock_ != NULL)
    return true;

  // We can't initialize the lock until we have read the options.
  if (!parameters->options_valid())
    return false;

  // If the user did not use --threads, then we can initialize
  // directly.
  if (!parameters->options().threads())
    {
      *this->pplock_ = new Lock();
      return true;
    }

#ifndef ENABLE_THREADS

  // If there is no threads support, we don't need to use
  // pthread_once.
  *this->pplock_ = new Lock();

#else // !defined(ENABLE_THREADS)

  // Since we can't pass parameters to routines called by
  // pthread_once, we use a static variable: initialize_lock_pointer.
  // That in turns means that we need to use a mutex to control access
  // to initialize_lock_pointer.

  int err = pthread_mutex_lock(&initialize_lock_control);
  if (err != 0)
    gold_fatal(_("pthread_mutex_lock failed: %s"), strerror(err));

  initialize_lock_pointer = this->pplock_;

  err = pthread_once(this->once_->once_control(), initialize_lock_once);
  if (err != 0)
    gold_fatal(_("pthread_once failed: %s"), strerror(err));

  initialize_lock_pointer = NULL;

  err = pthread_mutex_unlock(&initialize_lock_control);
  if (err != 0)
    gold_fatal(_("pthread_mutex_unlock failed: %s"), strerror(err));

  gold_assert(*this->pplock_ != NULL);

#endif // !defined(ENABLE_THREADS)

  return true;
}

} // End namespace gold.
