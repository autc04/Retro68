#include "Test.h"

#include <atomic>

/*
 * Exercises the out-of-line __atomic_* helpers provided by libretro/atomic.c.
 *
 * The compiler emits those helpers for operations it cannot perform inline:
 * 64-bit atomics on both 68K and PowerPC, and narrower sizes on 68K/68000 and
 * on classic PowerPC.  Alignment and type coverage matter, so all of the
 * integer widths plus a pointer and atomic_flag are tested.
 */

static std::atomic<int> ai;
static std::atomic<long long> all;
static std::atomic<char> ac;
static std::atomic<short> as;
static std::atomic<int *> ap;
static std::atomic_flag aflag = ATOMIC_FLAG_INIT;

static bool testAtomicInt()
{
    ai.store(1);
    if (ai.load() != 1)
        return false;

    if (ai.fetch_add(2) != 1)
        return false;
    if (ai.load() != 3)
        return false;
    if (ai.fetch_sub(1) != 3)
        return false;
    if (ai.load() != 2)
        return false;

    if (ai.exchange(10) != 2)
        return false;
    if (ai.load() != 10)
        return false;

    int expected = 10;
    if (!ai.compare_exchange_strong(expected, 20))
        return false;
    if (ai.load() != 20)
        return false;

    expected = 999;
    if (ai.compare_exchange_strong(expected, 30))
        return false;
    if (expected != 20)
        return false;
    if (ai.load() != 20)
        return false;

    if (ai.fetch_or(1) != 20)
        return false;
    if (ai.load() != 21)
        return false;
    if (ai.fetch_and(0x1e) != 21)
        return false;
    if (ai.load() != 20)
        return false;
    if (ai.fetch_xor(3) != 20)
        return false;
    if (ai.load() != 23)
        return false;

    return true;
}

static bool testAtomicLongLong()
{
    all.store(0x100000000LL);
    if (all.load() != 0x100000000LL)
        return false;

    if (all.fetch_add(1) != 0x100000000LL)
        return false;
    if (all.load() != 0x100000001LL)
        return false;

    long long expected = 0x100000001LL;
    if (!all.compare_exchange_strong(expected, 0x200000002LL))
        return false;
    if (all.load() != 0x200000002LL)
        return false;

    if (all.exchange(5) != 0x200000002LL)
        return false;
    if (all.load() != 5)
        return false;

    return true;
}

static bool testAtomicNarrow()
{
    ac.store(1);
    if (ac.load() != 1)
        return false;
    if (ac.fetch_add(2) != 1)
        return false;
    if (ac.load() != 3)
        return false;

    char charExpected = 3;
    if (!ac.compare_exchange_strong(charExpected, 4))
        return false;
    if (ac.load() != 4)
        return false;

    as.store(1000);
    if (as.load() != 1000)
        return false;
    if (as.fetch_add(23) != 1000)
        return false;
    if (as.load() != 1023)
        return false;

    return true;
}

static bool testAtomicPointer()
{
    int array[4];

    ap.store(&array[0]);
    if (ap.load() != &array[0])
        return false;
    if (ap.fetch_add(2) != &array[0])
        return false;
    if (ap.load() != &array[2])
        return false;

    return true;
}

static bool testAtomicFlag()
{
    aflag.clear();
    if (aflag.test_and_set())
        return false;
    if (!aflag.test_and_set())
        return false;
    aflag.clear();
    if (aflag.test_and_set())
        return false;

    return true;
}

static bool testIsLockFree()
{
    /* Only checks that the runtime query is callable and self-consistent;
       the answer itself depends on the CPU and multilib. */
    return ai.is_lock_free() == ai.is_lock_free();
}

static bool testSyncBuiltins()
{
    int value = 0;
    if (__sync_fetch_and_add(&value, 5) != 0)
        return false;
    if (value != 5)
        return false;
    if (__sync_add_and_fetch(&value, 1) != 6)
        return false;
    if (__sync_bool_compare_and_swap(&value, 6, 7) != true)
        return false;
    if (value != 7)
        return false;
    if (__sync_bool_compare_and_swap(&value, 6, 8) != false)
        return false;
    if (__sync_val_compare_and_swap(&value, 7, 9) != 7)
        return false;
    if (value != 9)
        return false;

    /* The 64-bit form is a helper on every CPU, so this pulls the __sync
       implementations in on 68020 and PowerPC as well. */
    long long wide = 0;
    if (__sync_fetch_and_add(&wide, 1) != 0)
        return false;
    if (wide != 1)
        return false;

    return true;
}

int main()
{
    bool ok = testAtomicInt()
           && testAtomicLongLong()
           && testAtomicNarrow()
           && testAtomicPointer()
           && testAtomicFlag()
           && testIsLockFree()
           && testSyncBuiltins();

    if (ok)
        TestLog("OK");
    else
        TestLog("NO");
}
