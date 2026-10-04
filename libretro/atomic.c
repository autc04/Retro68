/*
    Copyright 2026 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
 * Out-of-line implementations of the __atomic_* helper functions that GCC's C
 * and C++ front ends emit for operations the target cannot perform inline.
 *
 * Classic Mac OS on both 68K and PowerPC is a cooperatively scheduled,
 * single-threaded system: a task is only switched out at an explicit blocking
 * call, so a plain read-modify-write sequence cannot be interleaved with
 * another task.  These helpers are therefore ordinary C expressions, without
 * locks or interrupt-disabling critical sections.
 *
 * They are NOT safe to call from interrupt handlers.  Interrupt handlers may
 * only use naturally aligned loads and stores of at most four bytes, which GCC
 * emits inline and which never reach this file.  See
 * docs/ai/2026-10-04-atomic-helpers.md.
 *
 * GCC recognises both the unsuffixed and the size-suffixed __atomic_* names as
 * built-ins; defining functions with those exact C identifiers produces
 * "conflicting types for built-in function" warnings.  As GNU libatomic does,
 * the implementations are defined under internal names and the required
 * symbols are attached with asm labels.
 */

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

#ifndef __GCC_ATOMIC_TEST_AND_SET_TRUEVAL
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
#endif

/* Arithmetic/bitwise operations used by the fetch_OP_N and OP_fetch_N
   families.  The caller casts the result back to the operand type, which also
   takes care of the integer promotion of the narrow types.  */
#define RETRO68_OP_ADD(a, b)  ((a) + (b))
#define RETRO68_OP_SUB(a, b)  ((a) - (b))
#define RETRO68_OP_AND(a, b)  ((a) & (b))
#define RETRO68_OP_OR(a, b)   ((a) | (b))
#define RETRO68_OP_XOR(a, b)  ((a) ^ (b))
#define RETRO68_OP_NAND(a, b) (~((a) & (b)))

/* __atomic_fetch_OP_N: apply OP to *ptr, returning the previous value.
   __atomic_OP_fetch_N: apply OP to *ptr, returning the new value.  */
#define RETRO68_FETCH_OP(SZ, TYPE, OP, NAME)                                    \
  TYPE retro68_atomic_fetch_##NAME##_##SZ (TYPE *, TYPE, int)                   \
      __asm__ ("__atomic_fetch_" #NAME "_" #SZ);                               \
  TYPE retro68_atomic_fetch_##NAME##_##SZ (TYPE *ptr, TYPE value, int model)    \
  {                                                                             \
    (void) model;                                                               \
    TYPE old = *ptr;                                                            \
    *ptr = (TYPE) (OP (old, value));                                            \
    return old;                                                                 \
  }                                                                             \
                                                                                \
  TYPE retro68_atomic_##NAME##_fetch_##SZ (TYPE *, TYPE, int)                   \
      __asm__ ("__atomic_" #NAME "_fetch_" #SZ);                               \
  TYPE retro68_atomic_##NAME##_fetch_##SZ (TYPE *ptr, TYPE value, int model)    \
  {                                                                             \
    (void) model;                                                               \
    TYPE result = (TYPE) (OP (*ptr, value));                                    \
    *ptr = result;                                                              \
    return result;                                                              \
  }

#define RETRO68_ALL_FETCH_OPS(SZ, TYPE)                                         \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_ADD,  add)                             \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_SUB,  sub)                             \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_AND,  and)                             \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_OR,   or)                              \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_XOR,  xor)                             \
  RETRO68_FETCH_OP (SZ, TYPE, RETRO68_OP_NAND, nand)

/* __atomic_load_N / __atomic_store_N.  */
#define RETRO68_LOAD_STORE(SZ, TYPE)                                            \
  TYPE retro68_atomic_load_##SZ (TYPE *, int)                                   \
      __asm__ ("__atomic_load_" #SZ);                                           \
  TYPE retro68_atomic_load_##SZ (TYPE *ptr, int model)                          \
  {                                                                             \
    (void) model;                                                               \
    return *ptr;                                                                \
  }                                                                             \
                                                                                \
  void retro68_atomic_store_##SZ (TYPE *, TYPE, int)                            \
      __asm__ ("__atomic_store_" #SZ);                                          \
  void retro68_atomic_store_##SZ (TYPE *ptr, TYPE value, int model)             \
  {                                                                             \
    (void) model;                                                               \
    *ptr = value;                                                               \
  }

/* __atomic_exchange_N: store value and return the previous contents.  */
#define RETRO68_EXCHANGE(SZ, TYPE)                                              \
  TYPE retro68_atomic_exchange_##SZ (TYPE *, TYPE, int)                         \
      __asm__ ("__atomic_exchange_" #SZ);                                       \
  TYPE retro68_atomic_exchange_##SZ (TYPE *ptr, TYPE value, int model)          \
  {                                                                             \
    (void) model;                                                               \
    TYPE old = *ptr;                                                            \
    *ptr = value;                                                               \
    return old;                                                                 \
  }

/* __atomic_compare_exchange_N: if *ptr == *expected, store desired and return
   true; otherwise write the actual value back to *expected and return false.
   GCC drops the "weak" argument before calling this function.  */
#define RETRO68_COMPARE_EXCHANGE(SZ, TYPE)                                      \
  bool retro68_atomic_compare_exchange_##SZ (TYPE *, TYPE *, TYPE, int, int)    \
      __asm__ ("__atomic_compare_exchange_" #SZ);                               \
  bool retro68_atomic_compare_exchange_##SZ (TYPE *ptr, TYPE *expected,         \
                                             TYPE desired, int success_model,   \
                                             int failure_model)                 \
  {                                                                             \
    (void) success_model;                                                       \
    (void) failure_model;                                                       \
    if (*ptr == *expected)                                                      \
      {                                                                         \
        *ptr = desired;                                                         \
        return true;                                                            \
      }                                                                         \
    *expected = *ptr;                                                           \
    return false;                                                               \
  }

#define RETRO68_DEFINE_SIZE(SZ, TYPE)                                           \
  RETRO68_LOAD_STORE (SZ, TYPE)                                                 \
  RETRO68_EXCHANGE (SZ, TYPE)                                                   \
  RETRO68_COMPARE_EXCHANGE (SZ, TYPE)                                           \
  RETRO68_ALL_FETCH_OPS (SZ, TYPE)

RETRO68_DEFINE_SIZE (1, uint8_t)
RETRO68_DEFINE_SIZE (2, uint16_t)
RETRO68_DEFINE_SIZE (4, uint32_t)
RETRO68_DEFINE_SIZE (8, uint64_t)

/* __atomic_test_and_set_N: set *ptr to the target's true value and return
   whether it was previously non-zero.  GCC only emits the one-byte form; the
   wider forms operate on the first byte, as in libatomic.  */
bool retro68_atomic_test_and_set_1 (uint8_t *, int)
    __asm__ ("__atomic_test_and_set_1");
bool retro68_atomic_test_and_set_1 (uint8_t *ptr, int model)
{
  (void) model;
  uint8_t old = *ptr;
  *ptr = (uint8_t) __GCC_ATOMIC_TEST_AND_SET_TRUEVAL;
  return old != 0;
}

#define RETRO68_TEST_AND_SET_WIDE(SZ, TYPE)                                     \
  bool retro68_atomic_test_and_set_##SZ (TYPE *, int)                           \
      __asm__ ("__atomic_test_and_set_" #SZ);                                   \
  bool retro68_atomic_test_and_set_##SZ (TYPE *ptr, int model)                  \
  {                                                                             \
    return retro68_atomic_test_and_set_1 ((uint8_t *) ptr, model);              \
  }

RETRO68_TEST_AND_SET_WIDE (2, uint16_t)
RETRO68_TEST_AND_SET_WIDE (4, uint32_t)
RETRO68_TEST_AND_SET_WIDE (8, uint64_t)

/* Generic-size entry points, used for unaligned objects, non-power-of-two
   sizes and types without a matching integer mode.  On a single-threaded
   system these are plain byte copies.  */
void retro68_atomic_load_n (size_t, void *, void *, int)
    __asm__ ("__atomic_load");
void retro68_atomic_load_n (size_t n, void *ptr, void *ret, int model)
{
  (void) model;
  memcpy (ret, ptr, n);
}

void retro68_atomic_store_n (size_t, void *, void *, int)
    __asm__ ("__atomic_store");
void retro68_atomic_store_n (size_t n, void *ptr, void *value, int model)
{
  (void) model;
  memcpy (ptr, value, n);
}

void retro68_atomic_exchange_n (size_t, void *, void *, void *, int)
    __asm__ ("__atomic_exchange");
void retro68_atomic_exchange_n (size_t n, void *ptr, void *value, void *ret,
                                int model)
{
  (void) model;
  memcpy (ret, ptr, n);
  memcpy (ptr, value, n);
}

bool retro68_atomic_compare_exchange_n (size_t, void *, void *, void *, int, int)
    __asm__ ("__atomic_compare_exchange");
bool retro68_atomic_compare_exchange_n (size_t n, void *ptr, void *expected,
                                        void *desired, int success_model,
                                        int failure_model)
{
  (void) success_model;
  (void) failure_model;
  if (memcmp (ptr, expected, n) == 0)
    {
      memcpy (ptr, desired, n);
      return true;
    }
  memcpy (expected, ptr, n);
  return false;
}

/* __atomic_is_lock_free: report whether operations of the given size are
   implemented with lock-free instructions.  This mirrors what the compiler
   itself inlines, so it is false for exactly those sizes that are routed
   through this file.

   Note that libretrocrt is compiled once, with the default (68000) multilib,
   even when the application is linked for 68020/68040.  The answer is
   therefore conservative: it may report false for a size that a later CPU
   would implement inline.  Returning false when an operation actually is
   lock-free is permitted and safe.  */
bool retro68_atomic_is_lock_free (size_t, void *)
    __asm__ ("__atomic_is_lock_free");
bool retro68_atomic_is_lock_free (size_t n, void *ptr)
{
  (void) ptr;
  switch (n)
    {
    case 1:  return __atomic_always_lock_free (1, 0);
    case 2:  return __atomic_always_lock_free (2, 0);
    case 4:  return __atomic_always_lock_free (4, 0);
    case 8:  return __atomic_always_lock_free (8, 0);
    case 16: return __atomic_always_lock_free (16, 0);
    default: return false;
    }
}

/* ------------------------------------------------------------------------
 * Legacy __sync_* built-ins
 *
 * GCC's pre-C++11 atomic built-ins lower to these out-of-line functions when
 * the CPU cannot do the operation inline.  Unlike the __atomic family they
 * take no memory-order argument; every operation is a full barrier.  The
 * symbols are named __sync_fetch_and_OP_N and __sync_OP_and_fetch_N (note the
 * "and").  __sync_synchronize, __sync_lock_test_and_set and
 * __sync_lock_release are always expanded inline on these targets and so need
 * no out-of-line form; they are provided anyway for completeness.
 * ------------------------------------------------------------------------ */

#define RETRO68_SYNC_FETCH_OP(SZ, TYPE, OP, NAME)                               \
  TYPE retro68_sync_fetch_and_##NAME##_##SZ (TYPE *, TYPE)                      \
      __asm__ ("__sync_fetch_and_" #NAME "_" #SZ);                             \
  TYPE retro68_sync_fetch_and_##NAME##_##SZ (TYPE *ptr, TYPE value)             \
  {                                                                             \
    TYPE old = *ptr;                                                           \
    *ptr = (TYPE) (OP (old, value));                                            \
    return old;                                                                 \
  }                                                                             \
                                                                                \
  TYPE retro68_sync_##NAME##_and_fetch_##SZ (TYPE *, TYPE)                      \
      __asm__ ("__sync_" #NAME "_and_fetch_" #SZ);                              \
  TYPE retro68_sync_##NAME##_and_fetch_##SZ (TYPE *ptr, TYPE value)            \
  {                                                                             \
    TYPE result = (TYPE) (OP (*ptr, value));                                    \
    *ptr = result;                                                              \
    return result;                                                              \
  }

#define RETRO68_SYNC_ALL_FETCH_OPS(SZ, TYPE)                                    \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_ADD,  add)                        \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_SUB,  sub)                        \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_AND,  and)                        \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_OR,   or)                         \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_XOR,  xor)                        \
  RETRO68_SYNC_FETCH_OP (SZ, TYPE, RETRO68_OP_NAND, nand)

#define RETRO68_SYNC_COMPARE_EXCHANGE(SZ, TYPE)                                 \
  bool retro68_sync_bool_compare_and_swap_##SZ (TYPE *, TYPE, TYPE)             \
      __asm__ ("__sync_bool_compare_and_swap_" #SZ);                            \
  bool retro68_sync_bool_compare_and_swap_##SZ (TYPE *ptr, TYPE oldval,         \
                                                TYPE newval)                    \
  {                                                                             \
    if (*ptr == oldval)                                                         \
      {                                                                         \
        *ptr = newval;                                                          \
        return true;                                                            \
      }                                                                         \
    return false;                                                               \
  }                                                                             \
                                                                                \
  TYPE retro68_sync_val_compare_and_swap_##SZ (TYPE *, TYPE, TYPE)              \
      __asm__ ("__sync_val_compare_and_swap_" #SZ);                             \
  TYPE retro68_sync_val_compare_and_swap_##SZ (TYPE *ptr, TYPE oldval,          \
                                               TYPE newval)                     \
  {                                                                             \
    TYPE old = *ptr;                                                            \
    if (old == oldval)                                                          \
      *ptr = newval;                                                            \
    return old;                                                                 \
  }

#define RETRO68_SYNC_LOCK(SZ, TYPE)                                             \
  TYPE retro68_sync_lock_test_and_set_##SZ (TYPE *, TYPE)                       \
      __asm__ ("__sync_lock_test_and_set_" #SZ);                                \
  TYPE retro68_sync_lock_test_and_set_##SZ (TYPE *ptr, TYPE value)              \
  {                                                                             \
    TYPE old = *ptr;                                                            \
    *ptr = value;                                                               \
    return old;                                                                 \
  }                                                                             \
                                                                                \
  void retro68_sync_lock_release_##SZ (TYPE *)                                  \
      __asm__ ("__sync_lock_release_" #SZ);                                     \
  void retro68_sync_lock_release_##SZ (TYPE *ptr)                               \
  {                                                                             \
    *ptr = 0;                                                                   \
  }

#define RETRO68_DEFINE_SYNC_SIZE(SZ, TYPE)                                      \
  RETRO68_SYNC_ALL_FETCH_OPS (SZ, TYPE)                                         \
  RETRO68_SYNC_COMPARE_EXCHANGE (SZ, TYPE)                                      \
  RETRO68_SYNC_LOCK (SZ, TYPE)

RETRO68_DEFINE_SYNC_SIZE (1, uint8_t)
RETRO68_DEFINE_SYNC_SIZE (2, uint16_t)
RETRO68_DEFINE_SYNC_SIZE (4, uint32_t)
RETRO68_DEFINE_SYNC_SIZE (8, uint64_t)
