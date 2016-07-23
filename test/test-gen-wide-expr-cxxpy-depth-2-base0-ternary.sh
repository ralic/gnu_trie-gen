#!/bin/bash

# Copyright (C) 2016  Stefan Vargyas
# 
# This file is part of Trie-Gen.
# 
# Trie-Gen is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Trie-Gen is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Trie-Gen.  If not, see <http://www.gnu.org/licenses/>.

#
# File generated by a command like:
# $ gen-test -T gen-wide-expr-cxxpy-depth-2-base0-ternary
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-wide-expr-cxxpy-depth-2-base0-ternary.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=2 --trie=ternary "$@"; }
$ print a|trie
(
    a
)
$ print a ab|trie
(
    a [
        b
    ]
)
$ print a ab abc|trie
(
    a [
        b
    ]
)
$ print a b|trie
(
    a |
    b
)
$ print a b abc bac abd|trie
(
    a [
        b
    ] |
    b [
        ac
    ]
)
$ print a bb ba c|trie
(
    a |
    b (
        a |
        b
    ) |
    c
)
$ print a bb ba cc|trie
(
    a |
    b (
        a |
        b
    ) |
    cc
)
$ print a bb ba ccc|trie
(
    a |
    b (
        a |
        b
    ) |
    ccc
)
$ print a bb ba cde|trie
(
    a |
    b (
        a |
        b
    ) |
    cde
)
$ print a bb ba cdef|trie
(
    a |
    b (
        a |
        b
    ) |
    cdef
)
$ print a bb ba cdef cdefg|trie
(
    a |
    b (
        a |
        b
    ) |
    cdef [
        g
    ]
)
$ print a bb bac cdef|trie
(
    a |
    b (
        ac |
        b
    ) |
    cdef
)
$ print a bbx ba ccc|trie
(
    a |
    b (
        a |
        bx
    ) |
    ccc
)
$ print a bbx bay ccc|trie
(
    a |
    b (
        ay |
        bx
    ) |
    ccc
)
$ print a cde cdef|trie
(
    a |
    cde [
        f
    ]
)
$ print a cde cdef cdefg|trie
(
    a |
    cde [
        f
    ]
)
$ print a cde cdef cdefgh|trie
(
    a |
    cde [
        f
    ]
)
$ print a cdef cdefg|trie
(
    a |
    cdef [
        g
    ]
)
$ print ab|trie
(
    ab
)
$ print ab bb ba ccc|trie
(
    ab |
    b (
        a |
        b
    ) |
    ccc
)
$ print ab bb ba cde|trie
(
    ab |
    b (
        a |
        b
    ) |
    cde
)
$ print ab bbx ba ccc|trie
(
    ab |
    b (
        a |
        bx
    ) |
    ccc
)
$ print ab c|trie
(
    ab |
    c
)
$ print abc bb ba ccc|trie
(
    abc |
    b (
        a |
        b
    ) |
    ccc
)
$ print abcd abde abef|trie
(
    ab (
        cd |
        de |
        ef
    )
)
$ print abg a abc ab abd|trie
(
    a [
        b
    ]
)
$ print ac ab|trie
(
    a (
        b |
        c
    )
)
$ print aef ae abg a abc ab abd|trie
(
    a [
        b |
        e
    ]
)
$ print cde cdef cdefgh|trie
(
    cde [
        f
    ]
)
$ print cdef cdefg|trie
(
    cdef [
        g
    ]
)
$ print cdex cdfy cdgz cdhw|trie
(
    cd (
        ex |
        fy |
        gz |
        hw
    )
)
$ print ce cdex cdfy cdgz cdhw|trie
(
    c (
        d |
        e
    )
)
$ print pot potato pottery tattoo tempo|trie
(
    pot [
        ato |
        tery
    ] |
    t (
        attoo |
        empo
    )
)'
) -L gen-wide-expr-cxxpy-depth-2-base0-ternary.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=2 --trie=ternary "$@"; }'
trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=2 --trie=ternary "$@"; } 2>&1 ||
echo 'command failed: trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=2 --trie=ternary "$@"; }'

echo '$ print a|trie'
print a|trie 2>&1 ||
echo 'command failed: print a|trie'

echo '$ print a ab|trie'
print a ab|trie 2>&1 ||
echo 'command failed: print a ab|trie'

echo '$ print a ab abc|trie'
print a ab abc|trie 2>&1 ||
echo 'command failed: print a ab abc|trie'

echo '$ print a b|trie'
print a b|trie 2>&1 ||
echo 'command failed: print a b|trie'

echo '$ print a b abc bac abd|trie'
print a b abc bac abd|trie 2>&1 ||
echo 'command failed: print a b abc bac abd|trie'

echo '$ print a bb ba c|trie'
print a bb ba c|trie 2>&1 ||
echo 'command failed: print a bb ba c|trie'

echo '$ print a bb ba cc|trie'
print a bb ba cc|trie 2>&1 ||
echo 'command failed: print a bb ba cc|trie'

echo '$ print a bb ba ccc|trie'
print a bb ba ccc|trie 2>&1 ||
echo 'command failed: print a bb ba ccc|trie'

echo '$ print a bb ba cde|trie'
print a bb ba cde|trie 2>&1 ||
echo 'command failed: print a bb ba cde|trie'

echo '$ print a bb ba cdef|trie'
print a bb ba cdef|trie 2>&1 ||
echo 'command failed: print a bb ba cdef|trie'

echo '$ print a bb ba cdef cdefg|trie'
print a bb ba cdef cdefg|trie 2>&1 ||
echo 'command failed: print a bb ba cdef cdefg|trie'

echo '$ print a bb bac cdef|trie'
print a bb bac cdef|trie 2>&1 ||
echo 'command failed: print a bb bac cdef|trie'

echo '$ print a bbx ba ccc|trie'
print a bbx ba ccc|trie 2>&1 ||
echo 'command failed: print a bbx ba ccc|trie'

echo '$ print a bbx bay ccc|trie'
print a bbx bay ccc|trie 2>&1 ||
echo 'command failed: print a bbx bay ccc|trie'

echo '$ print a cde cdef|trie'
print a cde cdef|trie 2>&1 ||
echo 'command failed: print a cde cdef|trie'

echo '$ print a cde cdef cdefg|trie'
print a cde cdef cdefg|trie 2>&1 ||
echo 'command failed: print a cde cdef cdefg|trie'

echo '$ print a cde cdef cdefgh|trie'
print a cde cdef cdefgh|trie 2>&1 ||
echo 'command failed: print a cde cdef cdefgh|trie'

echo '$ print a cdef cdefg|trie'
print a cdef cdefg|trie 2>&1 ||
echo 'command failed: print a cdef cdefg|trie'

echo '$ print ab|trie'
print ab|trie 2>&1 ||
echo 'command failed: print ab|trie'

echo '$ print ab bb ba ccc|trie'
print ab bb ba ccc|trie 2>&1 ||
echo 'command failed: print ab bb ba ccc|trie'

echo '$ print ab bb ba cde|trie'
print ab bb ba cde|trie 2>&1 ||
echo 'command failed: print ab bb ba cde|trie'

echo '$ print ab bbx ba ccc|trie'
print ab bbx ba ccc|trie 2>&1 ||
echo 'command failed: print ab bbx ba ccc|trie'

echo '$ print ab c|trie'
print ab c|trie 2>&1 ||
echo 'command failed: print ab c|trie'

echo '$ print abc bb ba ccc|trie'
print abc bb ba ccc|trie 2>&1 ||
echo 'command failed: print abc bb ba ccc|trie'

echo '$ print abcd abde abef|trie'
print abcd abde abef|trie 2>&1 ||
echo 'command failed: print abcd abde abef|trie'

echo '$ print abg a abc ab abd|trie'
print abg a abc ab abd|trie 2>&1 ||
echo 'command failed: print abg a abc ab abd|trie'

echo '$ print ac ab|trie'
print ac ab|trie 2>&1 ||
echo 'command failed: print ac ab|trie'

echo '$ print aef ae abg a abc ab abd|trie'
print aef ae abg a abc ab abd|trie 2>&1 ||
echo 'command failed: print aef ae abg a abc ab abd|trie'

echo '$ print cde cdef cdefgh|trie'
print cde cdef cdefgh|trie 2>&1 ||
echo 'command failed: print cde cdef cdefgh|trie'

echo '$ print cdef cdefg|trie'
print cdef cdefg|trie 2>&1 ||
echo 'command failed: print cdef cdefg|trie'

echo '$ print cdex cdfy cdgz cdhw|trie'
print cdex cdfy cdgz cdhw|trie 2>&1 ||
echo 'command failed: print cdex cdfy cdgz cdhw|trie'

echo '$ print ce cdex cdfy cdgz cdhw|trie'
print ce cdex cdfy cdgz cdhw|trie 2>&1 ||
echo 'command failed: print ce cdex cdfy cdgz cdhw|trie'

echo '$ print pot potato pottery tattoo tempo|trie'
print pot potato pottery tattoo tempo|trie 2>&1 ||
echo 'command failed: print pot potato pottery tattoo tempo|trie'
)

