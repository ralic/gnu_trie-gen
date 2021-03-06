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
# $ gen-test -T gen-compact-c-code-base0-array
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-compact-c-code-base0-array.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ trie() { ../src/trie --gen=compact --output=c-code --trie=array "$@"; }
$ print a|trie
    if (*p ++ == '\''a'\'' &&
        *p == 0)
        return "a";
    return error;
$ print a ab|trie
    if (*p ++ == '\''a'\'') {
        if (*p == 0)
            return "a";
        if (*p ++ == '\''b'\'' &&
            *p == 0)
            return "ab";
    }
    return error;
$ print a ab abc|trie
    if (*p ++ == '\''a'\'') {
        if (*p == 0)
            return "a";
        if (*p ++ == '\''b'\'') {
            if (*p == 0)
                return "ab";
            if (*p ++ == '\''c'\'' &&
                *p == 0)
                return "abc";
        }
    }
    return error;
$ print a b|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        if (*p == 0)
            return "b";
    }
    return error;
$ print a b abc bac abd|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        if (*p ++ == '\''b'\'') {
            switch (*p ++) {
            case '\''c'\'':
                if (*p == 0)
                    return "abc";
                return error;
            case '\''d'\'':
                if (*p == 0)
                    return "abd";
            }
        }
        return error;
    case '\''b'\'':
        if (*p == 0)
            return "b";
        if (*p ++ == '\''a'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "bac";
    }
    return error;
$ print a bb ba c|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p == 0)
            return "c";
    }
    return error;
$ print a bb ba cc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p == 0)
            return "cc";
    }
    return error;
$ print a bb ba ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print a bb ba cde|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p == 0)
            return "cde";
    }
    return error;
$ print a bb ba cdef|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p ++ == '\''f'\'' &&
            *p == 0)
            return "cdef";
    }
    return error;
$ print a bb ba cdef cdefg|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p ++ == '\''f'\'') {
            if (*p == 0)
                return "cdef";
            if (*p ++ == '\''g'\'' &&
                *p == 0)
                return "cdefg";
        }
    }
    return error;
$ print a bb bac cdef|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p ++ == '\''c'\'' &&
                *p == 0)
                return "bac";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p ++ == '\''f'\'' &&
            *p == 0)
            return "cdef";
    }
    return error;
$ print a bbx ba ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p ++ == '\''x'\'' &&
                *p == 0)
                return "bbx";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print a bbx bay ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p ++ == '\''y'\'' &&
                *p == 0)
                return "bay";
            return error;
        case '\''b'\'':
            if (*p ++ == '\''x'\'' &&
                *p == 0)
                return "bbx";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print a cde cdef|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'') {
            if (*p == 0)
                return "cde";
            if (*p ++ == '\''f'\'' &&
                *p == 0)
                return "cdef";
        }
    }
    return error;
$ print a cde cdef cdefg|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'') {
            if (*p == 0)
                return "cde";
            if (*p ++ == '\''f'\'') {
                if (*p == 0)
                    return "cdef";
                if (*p ++ == '\''g'\'' &&
                    *p == 0)
                    return "cdefg";
            }
        }
    }
    return error;
$ print a cde cdef cdefgh|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'') {
            if (*p == 0)
                return "cde";
            if (*p ++ == '\''f'\'') {
                if (*p == 0)
                    return "cdef";
                if (*p ++ == '\''g'\'' &&
                    *p ++ == '\''h'\'' &&
                    *p == 0)
                    return "cdefgh";
            }
        }
    }
    return error;
$ print a cdef cdefg|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p == 0)
            return "a";
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p ++ == '\''f'\'') {
            if (*p == 0)
                return "cdef";
            if (*p ++ == '\''g'\'' &&
                *p == 0)
                return "cdefg";
        }
    }
    return error;
$ print ab|trie
    if (*p ++ == '\''a'\'' &&
        *p ++ == '\''b'\'' &&
        *p == 0)
        return "ab";
    return error;
$ print ab bb ba ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p ++ == '\''b'\'' &&
            *p == 0)
            return "ab";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print ab bb ba cde|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p ++ == '\''b'\'' &&
            *p == 0)
            return "ab";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''d'\'' &&
            *p ++ == '\''e'\'' &&
            *p == 0)
            return "cde";
    }
    return error;
$ print ab bbx ba ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p ++ == '\''b'\'' &&
            *p == 0)
            return "ab";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p ++ == '\''x'\'' &&
                *p == 0)
                return "bbx";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print ab c|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p ++ == '\''b'\'' &&
            *p == 0)
            return "ab";
        return error;
    case '\''c'\'':
        if (*p == 0)
            return "c";
    }
    return error;
$ print abc bb ba ccc|trie
    switch (*p ++) {
    case '\''a'\'':
        if (*p ++ == '\''b'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "abc";
        return error;
    case '\''b'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p == 0)
                return "ba";
            return error;
        case '\''b'\'':
            if (*p == 0)
                return "bb";
        }
        return error;
    case '\''c'\'':
        if (*p ++ == '\''c'\'' &&
            *p ++ == '\''c'\'' &&
            *p == 0)
            return "ccc";
    }
    return error;
$ print abcd abde abef|trie
    if (*p ++ == '\''a'\'' &&
        *p ++ == '\''b'\'') {
        switch (*p ++) {
        case '\''c'\'':
            if (*p ++ == '\''d'\'' &&
                *p == 0)
                return "abcd";
            return error;
        case '\''d'\'':
            if (*p ++ == '\''e'\'' &&
                *p == 0)
                return "abde";
            return error;
        case '\''e'\'':
            if (*p ++ == '\''f'\'' &&
                *p == 0)
                return "abef";
        }
    }
    return error;
$ print abg a abc ab abd|trie
    if (*p ++ == '\''a'\'') {
        if (*p == 0)
            return "a";
        if (*p ++ == '\''b'\'') {
            if (*p == 0)
                return "ab";
            switch (*p ++) {
            case '\''c'\'':
                if (*p == 0)
                    return "abc";
                return error;
            case '\''d'\'':
                if (*p == 0)
                    return "abd";
                return error;
            case '\''g'\'':
                if (*p == 0)
                    return "abg";
            }
        }
    }
    return error;
$ print ac ab|trie
    if (*p ++ == '\''a'\'') {
        switch (*p ++) {
        case '\''b'\'':
            if (*p == 0)
                return "ab";
            return error;
        case '\''c'\'':
            if (*p == 0)
                return "ac";
        }
    }
    return error;
$ print aef ae abg a abc ab abd|trie
    if (*p ++ == '\''a'\'') {
        if (*p == 0)
            return "a";
        switch (*p ++) {
        case '\''b'\'':
            if (*p == 0)
                return "ab";
            switch (*p ++) {
            case '\''c'\'':
                if (*p == 0)
                    return "abc";
                return error;
            case '\''d'\'':
                if (*p == 0)
                    return "abd";
                return error;
            case '\''g'\'':
                if (*p == 0)
                    return "abg";
            }
            return error;
        case '\''e'\'':
            if (*p == 0)
                return "ae";
            if (*p ++ == '\''f'\'' &&
                *p == 0)
                return "aef";
        }
    }
    return error;
$ print cde cdef cdefgh|trie
    if (*p ++ == '\''c'\'' &&
        *p ++ == '\''d'\'' &&
        *p ++ == '\''e'\'') {
        if (*p == 0)
            return "cde";
        if (*p ++ == '\''f'\'') {
            if (*p == 0)
                return "cdef";
            if (*p ++ == '\''g'\'' &&
                *p ++ == '\''h'\'' &&
                *p == 0)
                return "cdefgh";
        }
    }
    return error;
$ print cdef cdefg|trie
    if (*p ++ == '\''c'\'' &&
        *p ++ == '\''d'\'' &&
        *p ++ == '\''e'\'' &&
        *p ++ == '\''f'\'') {
        if (*p == 0)
            return "cdef";
        if (*p ++ == '\''g'\'' &&
            *p == 0)
            return "cdefg";
    }
    return error;
$ print cdex cdfy cdgz cdhw|trie
    if (*p ++ == '\''c'\'' &&
        *p ++ == '\''d'\'') {
        switch (*p ++) {
        case '\''e'\'':
            if (*p ++ == '\''x'\'' &&
                *p == 0)
                return "cdex";
            return error;
        case '\''f'\'':
            if (*p ++ == '\''y'\'' &&
                *p == 0)
                return "cdfy";
            return error;
        case '\''g'\'':
            if (*p ++ == '\''z'\'' &&
                *p == 0)
                return "cdgz";
            return error;
        case '\''h'\'':
            if (*p ++ == '\''w'\'' &&
                *p == 0)
                return "cdhw";
        }
    }
    return error;
$ print ce cdex cdfy cdgz cdhw|trie
    if (*p ++ == '\''c'\'') {
        switch (*p ++) {
        case '\''d'\'':
            switch (*p ++) {
            case '\''e'\'':
                if (*p ++ == '\''x'\'' &&
                    *p == 0)
                    return "cdex";
                return error;
            case '\''f'\'':
                if (*p ++ == '\''y'\'' &&
                    *p == 0)
                    return "cdfy";
                return error;
            case '\''g'\'':
                if (*p ++ == '\''z'\'' &&
                    *p == 0)
                    return "cdgz";
                return error;
            case '\''h'\'':
                if (*p ++ == '\''w'\'' &&
                    *p == 0)
                    return "cdhw";
            }
            return error;
        case '\''e'\'':
            if (*p == 0)
                return "ce";
        }
    }
    return error;
$ print pot potato pottery tattoo tempo|trie
    switch (*p ++) {
    case '\''p'\'':
        if (*p ++ == '\''o'\'' &&
            *p ++ == '\''t'\'') {
            if (*p == 0)
                return "pot";
            switch (*p ++) {
            case '\''a'\'':
                if (*p ++ == '\''t'\'' &&
                    *p ++ == '\''o'\'' &&
                    *p == 0)
                    return "potato";
                return error;
            case '\''t'\'':
                if (*p ++ == '\''e'\'' &&
                    *p ++ == '\''r'\'' &&
                    *p ++ == '\''y'\'' &&
                    *p == 0)
                    return "pottery";
            }
        }
        return error;
    case '\''t'\'':
        switch (*p ++) {
        case '\''a'\'':
            if (*p ++ == '\''t'\'' &&
                *p ++ == '\''t'\'' &&
                *p ++ == '\''o'\'' &&
                *p ++ == '\''o'\'' &&
                *p == 0)
                return "tattoo";
            return error;
        case '\''e'\'':
            if (*p ++ == '\''m'\'' &&
                *p ++ == '\''p'\'' &&
                *p ++ == '\''o'\'' &&
                *p == 0)
                return "tempo";
        }
    }
    return error;'
) -L gen-compact-c-code-base0-array.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ trie() { ../src/trie --gen=compact --output=c-code --trie=array "$@"; }'
trie() { ../src/trie --gen=compact --output=c-code --trie=array "$@"; } 2>&1 ||
echo 'command failed: trie() { ../src/trie --gen=compact --output=c-code --trie=array "$@"; }'

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

