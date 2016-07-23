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
# $ gen-test -T gen-compact-trie-base0-ternary
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-compact-trie-base0-ternary.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ trie() { ../src/trie --gen=compact --output=trie --trie=ternary "$@"; }
$ print a|trie
{
    "a": "a"
}
$ print a ab|trie
{
    "a": "a" {
        "b": "ab"
    }
}
$ print a ab abc|trie
{
    "a": "a" {
        "b": "ab" {
            "c": "abc"
        }
    }
}
$ print a b|trie
{
    "a": "a"
    "b": "b"
}
$ print a b abc bac abd|trie
{
    "a": "a" {
        "b" {
            "c": "abc"
            "d": "abd"
        }
    }
    "b": "b" {
        "ac": "bac"
    }
}
$ print a bb ba c|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "c": "c"
}
$ print a bb ba cc|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "cc": "cc"
}
$ print a bb ba ccc|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "ccc": "ccc"
}
$ print a bb ba cde|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "cde": "cde"
}
$ print a bb ba cdef|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "cdef": "cdef"
}
$ print a bb ba cdef cdefg|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "cdef": "cdef" {
        "g": "cdefg"
    }
}
$ print a bb bac cdef|trie
{
    "a": "a"
    "b" {
        "ac": "bac"
        "b": "bb"
    }
    "cdef": "cdef"
}
$ print a bbx ba ccc|trie
{
    "a": "a"
    "b" {
        "a": "ba"
        "bx": "bbx"
    }
    "ccc": "ccc"
}
$ print a bbx bay ccc|trie
{
    "a": "a"
    "b" {
        "ay": "bay"
        "bx": "bbx"
    }
    "ccc": "ccc"
}
$ print a cde cdef|trie
{
    "a": "a"
    "cde": "cde" {
        "f": "cdef"
    }
}
$ print a cde cdef cdefg|trie
{
    "a": "a"
    "cde": "cde" {
        "f": "cdef" {
            "g": "cdefg"
        }
    }
}
$ print a cde cdef cdefgh|trie
{
    "a": "a"
    "cde": "cde" {
        "f": "cdef" {
            "gh": "cdefgh"
        }
    }
}
$ print a cdef cdefg|trie
{
    "a": "a"
    "cdef": "cdef" {
        "g": "cdefg"
    }
}
$ print ab|trie
{
    "ab": "ab"
}
$ print ab bb ba ccc|trie
{
    "ab": "ab"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "ccc": "ccc"
}
$ print ab bb ba cde|trie
{
    "ab": "ab"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "cde": "cde"
}
$ print ab bbx ba ccc|trie
{
    "ab": "ab"
    "b" {
        "a": "ba"
        "bx": "bbx"
    }
    "ccc": "ccc"
}
$ print ab c|trie
{
    "ab": "ab"
    "c": "c"
}
$ print abc bb ba ccc|trie
{
    "abc": "abc"
    "b" {
        "a": "ba"
        "b": "bb"
    }
    "ccc": "ccc"
}
$ print abcd abde abef|trie
{
    "ab" {
        "cd": "abcd"
        "de": "abde"
        "ef": "abef"
    }
}
$ print abg a abc ab abd|trie
{
    "a": "a" {
        "b": "ab" {
            "c": "abc"
            "d": "abd"
            "g": "abg"
        }
    }
}
$ print ac ab|trie
{
    "a" {
        "b": "ab"
        "c": "ac"
    }
}
$ print aef ae abg a abc ab abd|trie
{
    "a": "a" {
        "b": "ab" {
            "c": "abc"
            "d": "abd"
            "g": "abg"
        }
        "e": "ae" {
            "f": "aef"
        }
    }
}
$ print cde cdef cdefgh|trie
{
    "cde": "cde" {
        "f": "cdef" {
            "gh": "cdefgh"
        }
    }
}
$ print cdef cdefg|trie
{
    "cdef": "cdef" {
        "g": "cdefg"
    }
}
$ print cdex cdfy cdgz cdhw|trie
{
    "cd" {
        "ex": "cdex"
        "fy": "cdfy"
        "gz": "cdgz"
        "hw": "cdhw"
    }
}
$ print ce cdex cdfy cdgz cdhw|trie
{
    "c" {
        "d" {
            "ex": "cdex"
            "fy": "cdfy"
            "gz": "cdgz"
            "hw": "cdhw"
        }
        "e": "ce"
    }
}
$ print pot potato pottery tattoo tempo|trie
{
    "pot": "pot" {
        "ato": "potato"
        "tery": "pottery"
    }
    "t" {
        "attoo": "tattoo"
        "empo": "tempo"
    }
}'
) -L gen-compact-trie-base0-ternary.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ trie() { ../src/trie --gen=compact --output=trie --trie=ternary "$@"; }'
trie() { ../src/trie --gen=compact --output=trie --trie=ternary "$@"; } 2>&1 ||
echo 'command failed: trie() { ../src/trie --gen=compact --output=trie --trie=ternary "$@"; }'

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

