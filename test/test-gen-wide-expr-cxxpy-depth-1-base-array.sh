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
# $ gen-test -T gen-wide-expr-cxxpy-depth-1-base-array
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-wide-expr-cxxpy-depth-1-base-array.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=1 --dots --trie=array "$@"; }
$ print|trie
trie: error: tries cannot contain empty keys
command failed: print|trie
$ print a|trie
(
.   a
)
$ print a b|trie
(
.   a |
.   b
)
$ print a b c|trie
(
.   a |
.   b |
.   c
)
$ print a ab abc|trie
(
.   a
)
$ print a ab ac|trie
(
.   a
)
$ print a ab ac ad|trie
(
.   a
)
$ print a abd ac|trie
(
.   a
)
$ print a ab ac acd|trie
(
.   a
)
$ print a bb ba ccc|trie
(
.   a |
.   b |
.   ccc
)
$ print a bb ccc|trie
(
.   a |
.   bb |
.   ccc
)
$ print a bb ba ccc|trie
(
.   a |
.   b |
.   ccc
)
$ print abc abd acde|trie
(
.   a
)
$ print abc abd acde ac|trie
(
.   a
)
$ print abc abd acde acfg|trie
(
.   a
)
$ print cde cfg cfgx cfgxy cfgxyz cfgxzzz|trie
(
.   c
)
$ print cge cfg cfgx cfgxy cfgxyz cfgxzzz|trie
(
.   c
)
$ print a abcd abcdefg h hijk|trie
(
.   a |
.   h
)
$ print a abcd abcdefg abcdxyz h hijk|trie
(
.   a |
.   h
)
$ print a abcd abcdefg abcdxyz h hijk hlm|trie
(
.   a |
.   h
)'
) -L gen-wide-expr-cxxpy-depth-1-base-array.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=1 --dots --trie=array "$@"; }'
trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=1 --dots --trie=array "$@"; } 2>&1 ||
echo 'command failed: trie() { ../src/trie --gen=wide --output=expr --expr=cxxpy --depth=1 --dots --trie=array "$@"; }'

echo '$ print|trie'
print|trie 2>&1 ||
echo 'command failed: print|trie'

echo '$ print a|trie'
print a|trie 2>&1 ||
echo 'command failed: print a|trie'

echo '$ print a b|trie'
print a b|trie 2>&1 ||
echo 'command failed: print a b|trie'

echo '$ print a b c|trie'
print a b c|trie 2>&1 ||
echo 'command failed: print a b c|trie'

echo '$ print a ab abc|trie'
print a ab abc|trie 2>&1 ||
echo 'command failed: print a ab abc|trie'

echo '$ print a ab ac|trie'
print a ab ac|trie 2>&1 ||
echo 'command failed: print a ab ac|trie'

echo '$ print a ab ac ad|trie'
print a ab ac ad|trie 2>&1 ||
echo 'command failed: print a ab ac ad|trie'

echo '$ print a abd ac|trie'
print a abd ac|trie 2>&1 ||
echo 'command failed: print a abd ac|trie'

echo '$ print a ab ac acd|trie'
print a ab ac acd|trie 2>&1 ||
echo 'command failed: print a ab ac acd|trie'

echo '$ print a bb ba ccc|trie'
print a bb ba ccc|trie 2>&1 ||
echo 'command failed: print a bb ba ccc|trie'

echo '$ print a bb ccc|trie'
print a bb ccc|trie 2>&1 ||
echo 'command failed: print a bb ccc|trie'

echo '$ print a bb ba ccc|trie'
print a bb ba ccc|trie 2>&1 ||
echo 'command failed: print a bb ba ccc|trie'

echo '$ print abc abd acde|trie'
print abc abd acde|trie 2>&1 ||
echo 'command failed: print abc abd acde|trie'

echo '$ print abc abd acde ac|trie'
print abc abd acde ac|trie 2>&1 ||
echo 'command failed: print abc abd acde ac|trie'

echo '$ print abc abd acde acfg|trie'
print abc abd acde acfg|trie 2>&1 ||
echo 'command failed: print abc abd acde acfg|trie'

echo '$ print cde cfg cfgx cfgxy cfgxyz cfgxzzz|trie'
print cde cfg cfgx cfgxy cfgxyz cfgxzzz|trie 2>&1 ||
echo 'command failed: print cde cfg cfgx cfgxy cfgxyz cfgxzzz|trie'

echo '$ print cge cfg cfgx cfgxy cfgxyz cfgxzzz|trie'
print cge cfg cfgx cfgxy cfgxyz cfgxzzz|trie 2>&1 ||
echo 'command failed: print cge cfg cfgx cfgxy cfgxyz cfgxzzz|trie'

echo '$ print a abcd abcdefg h hijk|trie'
print a abcd abcdefg h hijk|trie 2>&1 ||
echo 'command failed: print a abcd abcdefg h hijk|trie'

echo '$ print a abcd abcdefg abcdxyz h hijk|trie'
print a abcd abcdefg abcdxyz h hijk|trie 2>&1 ||
echo 'command failed: print a abcd abcdefg abcdxyz h hijk|trie'

echo '$ print a abcd abcdefg abcdxyz h hijk hlm|trie'
print a abcd abcdefg abcdxyz h hijk hlm|trie 2>&1 ||
echo 'command failed: print a abcd abcdefg abcdxyz h hijk hlm|trie'
)

