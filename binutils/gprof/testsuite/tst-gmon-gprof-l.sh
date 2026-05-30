#!/bin/sh
# Check the output of gprof against a carfully crafted binary.
# Copyright (C) 2017-2026 Free Software Foundation, Inc.
# This file is part of the GNU C Library.

# The GNU C Library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# The GNU C Library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with the GNU C Library; if not, see
# <https://www.gnu.org/licenses/>.

GPROF="$1"
if test -z "$GPROF"; then
  # Exit 0 for automake test script run.
  exit 0
fi

program="$2"
# Generate gmon.out
data=gmon.out
rm -f $data
./$program
if test ! -s $data; then
    echo "FAIL"
    exit 1
fi

LC_ALL=C
export LC_ALL
set -e
exec 2>&1

actual=${program}.actual-l
expected=${program}.expected-l
expected_dot=${program}.expected_dot-l
cleanup () {
    rm -f "$actual"
    rm -f "$expected"
    rm -f "$expected_dot"
}
trap cleanup 0

cat > "$expected" <<EOF
25 f1 2000
31 f2 1000
40 f3 1
EOF

# Special version for powerpc with function descriptors.
cat > "$expected_dot" <<EOF
25 .f1 2000
31 .f2 1000
40 .f3 1
EOF

"$GPROF" -l -C "$program" "$data" \
    | awk -F  '[(): ]' '/executions/{print $2, $5, $8}' \
    | sort > "$actual"

if cmp -s "$actual" "$expected_dot" \
   || diff -u --label expected "$expected" --label actual "$actual" ; then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi
