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
# $ gen-test -T gen-compact-c-code-base-ternary
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-compact-c-code-base-ternary.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ trie() { ../src/trie --gen=compact --output=c-code --attrs --dots --trie=ternary "$@"; }
$ print|trie
trie: error: tries cannot contain empty keys
command failed: print|trie
$ print a|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[0]]
.   if (*p ++ == '\''a'\'' &&
.   .   *p == 0)
.   .   return "a";
.   return error;
$ print a b|trie
.   // [2,'\''b'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[0]]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   return error;
.   // [0,"",'\''b'\'',[0]]
.   case '\''b'\'':
.   .   if (*p == 0)
.   .   .   return "b";
.   }
.   return error;
$ print a b c|trie
.   // [3,'\''c'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[0]]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   return error;
.   // [0,"",'\''b'\'',[0]]
.   case '\''b'\'':
.   .   if (*p == 0)
.   .   .   return "b";
.   .   return error;
.   // [0,"",'\''c'\'',[0]]
.   case '\''c'\'':
.   .   if (*p == 0)
.   .   .   return "c";
.   }
.   return error;
$ print a ab abc|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[1,'\''b'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   if (*p == 0)
.   .   .   return "a";
.   .   // [0,"",'\''b'\'',[1,'\''c'\'']]
.   .   if (*p ++ == '\''b'\'') {
.   .   .   if (*p == 0)
.   .   .   .   return "ab";
.   .   .   // [0,"",'\''c'\'',[0]]
.   .   .   if (*p ++ == '\''c'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "abc";
.   .   }
.   }
.   return error;
$ print a ab ac|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   if (*p == 0)
.   .   .   return "a";
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ab";
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[0]]
.   .   case '\''c'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ac";
.   .   }
.   }
.   return error;
$ print a ab ac ad|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[3,'\''d'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   if (*p == 0)
.   .   .   return "a";
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ab";
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[0]]
.   .   case '\''c'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ac";
.   .   .   return error;
.   .   // [0,"",'\''d'\'',[0]]
.   .   case '\''d'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ad";
.   .   }
.   }
.   return error;
$ print a abd ac|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   if (*p == 0)
.   .   .   return "a";
.   .   switch (*p ++) {
.   .   // [0,"b",'\''d'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p ++ == '\''d'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "abd";
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[0]]
.   .   case '\''c'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ac";
.   .   }
.   }
.   return error;
$ print a ab ac acd|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   if (*p == 0)
.   .   .   return "a";
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ab";
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[1,'\''d'\'']]
.   .   case '\''c'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ac";
.   .   .   // [0,"",'\''d'\'',[0]]
.   .   .   if (*p ++ == '\''d'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "acd";
.   .   }
.   }
.   return error;
$ print a bb ba ccc|trie
.   // [3,'\''c'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[0]]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   return error;
.   // [0,"",'\''b'\'',[2,'\''b'\'']]
.   case '\''b'\'':
.   .   switch (*p ++) {
.   .   // [0,"",'\''a'\'',[0]]
.   .   case '\''a'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ba";
.   .   .   return error;
.   .   // [0,"",'\''b'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "bb";
.   .   }
.   .   return error;
.   // [0,"cc",'\''c'\'',[0]]
.   case '\''c'\'':
.   .   if (*p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p == 0)
.   .   .   return "ccc";
.   }
.   return error;
$ print a bb ccc|trie
.   // [3,'\''c'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[0]]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   return error;
.   // [0,"b",'\''b'\'',[0]]
.   case '\''b'\'':
.   .   if (*p ++ == '\''b'\'' &&
.   .   .   *p == 0)
.   .   .   return "bb";
.   .   return error;
.   // [0,"cc",'\''c'\'',[0]]
.   case '\''c'\'':
.   .   if (*p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p == 0)
.   .   .   return "ccc";
.   }
.   return error;
$ print a bb ba ccc|trie
.   // [3,'\''c'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[0]]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   return error;
.   // [0,"",'\''b'\'',[2,'\''b'\'']]
.   case '\''b'\'':
.   .   switch (*p ++) {
.   .   // [0,"",'\''a'\'',[0]]
.   .   case '\''a'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ba";
.   .   .   return error;
.   .   // [0,"",'\''b'\'',[0]]
.   .   case '\''b'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "bb";
.   .   }
.   .   return error;
.   // [0,"cc",'\''c'\'',[0]]
.   case '\''c'\'':
.   .   if (*p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p == 0)
.   .   .   return "ccc";
.   }
.   return error;
$ print abc abd acde|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[2,'\''d'\'']]
.   .   case '\''b'\'':
.   .   .   switch (*p ++) {
.   .   .   // [0,"",'\''c'\'',[0]]
.   .   .   case '\''c'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abc";
.   .   .   .   return error;
.   .   .   // [0,"",'\''d'\'',[0]]
.   .   .   case '\''d'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abd";
.   .   .   }
.   .   .   return error;
.   .   // [0,"cd",'\''e'\'',[0]]
.   .   case '\''c'\'':
.   .   .   if (*p ++ == '\''d'\'' &&
.   .   .   .   *p ++ == '\''e'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "acde";
.   .   }
.   }
.   return error;
$ print abc abd acde ac|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[2,'\''d'\'']]
.   .   case '\''b'\'':
.   .   .   switch (*p ++) {
.   .   .   // [0,"",'\''c'\'',[0]]
.   .   .   case '\''c'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abc";
.   .   .   .   return error;
.   .   .   // [0,"",'\''d'\'',[0]]
.   .   .   case '\''d'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abd";
.   .   .   }
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[1,'\''d'\'']]
.   .   case '\''c'\'':
.   .   .   if (*p == 0)
.   .   .   .   return "ac";
.   .   .   // [0,"d",'\''e'\'',[0]]
.   .   .   if (*p ++ == '\''d'\'' &&
.   .   .   .   *p ++ == '\''e'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "acde";
.   .   }
.   }
.   return error;
$ print abc abd acde acfg|trie
.   // [1,'\''a'\'']
.   // [0,"",'\''a'\'',[2,'\''c'\'']]
.   if (*p ++ == '\''a'\'') {
.   .   switch (*p ++) {
.   .   // [0,"",'\''b'\'',[2,'\''d'\'']]
.   .   case '\''b'\'':
.   .   .   switch (*p ++) {
.   .   .   // [0,"",'\''c'\'',[0]]
.   .   .   case '\''c'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abc";
.   .   .   .   return error;
.   .   .   // [0,"",'\''d'\'',[0]]
.   .   .   case '\''d'\'':
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "abd";
.   .   .   }
.   .   .   return error;
.   .   // [0,"",'\''c'\'',[2,'\''f'\'']]
.   .   case '\''c'\'':
.   .   .   switch (*p ++) {
.   .   .   // [0,"d",'\''e'\'',[0]]
.   .   .   case '\''d'\'':
.   .   .   .   if (*p ++ == '\''e'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "acde";
.   .   .   .   return error;
.   .   .   // [0,"f",'\''g'\'',[0]]
.   .   .   case '\''f'\'':
.   .   .   .   if (*p ++ == '\''g'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "acfg";
.   .   .   }
.   .   }
.   }
.   return error;
$ print cde cfg cfgx cfgxy cfgxyz cfgxzzz|trie
.   // [1,'\''c'\'']
.   // [0,"",'\''c'\'',[2,'\''f'\'']]
.   if (*p ++ == '\''c'\'') {
.   .   switch (*p ++) {
.   .   // [0,"d",'\''e'\'',[0]]
.   .   case '\''d'\'':
.   .   .   if (*p ++ == '\''e'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "cde";
.   .   .   return error;
.   .   // [0,"f",'\''g'\'',[1,'\''x'\'']]
.   .   case '\''f'\'':
.   .   .   if (*p ++ == '\''g'\'') {
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "cfg";
.   .   .   .   // [1,"f",'\''x'\'',[2,'\''z'\'']]
.   .   .   .   if (*p ++ == '\''x'\'') {
.   .   .   .   .   if (*p == 0)
.   .   .   .   .   .   return "cfgx";
.   .   .   .   .   switch (*p ++) {
.   .   .   .   .   // [1,"f",'\''y'\'',[1,'\''z'\'']]
.   .   .   .   .   case '\''y'\'':
.   .   .   .   .   .   if (*p == 0)
.   .   .   .   .   .   .   return "cfgxy";
.   .   .   .   .   .   // [1,"f",'\''z'\'',[0]]
.   .   .   .   .   .   if (*p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p == 0)
.   .   .   .   .   .   .   return "cfgxyz";
.   .   .   .   .   .   return error;
.   .   .   .   .   // [1,"fzz",'\''z'\'',[0]]
.   .   .   .   .   case '\''z'\'':
.   .   .   .   .   .   if (*p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p == 0)
.   .   .   .   .   .   .   return "cfgxzzz";
.   .   .   .   .   }
.   .   .   .   }
.   .   .   }
.   .   }
.   }
.   return error;
$ print cge cfg cfgx cfgxy cfgxyz cfgxzzz|trie
.   // [1,'\''c'\'']
.   // [0,"",'\''c'\'',[2,'\''g'\'']]
.   if (*p ++ == '\''c'\'') {
.   .   switch (*p ++) {
.   .   // [0,"f",'\''g'\'',[1,'\''x'\'']]
.   .   case '\''f'\'':
.   .   .   if (*p ++ == '\''g'\'') {
.   .   .   .   if (*p == 0)
.   .   .   .   .   return "cfg";
.   .   .   .   // [1,"f",'\''x'\'',[2,'\''z'\'']]
.   .   .   .   if (*p ++ == '\''x'\'') {
.   .   .   .   .   if (*p == 0)
.   .   .   .   .   .   return "cfgx";
.   .   .   .   .   switch (*p ++) {
.   .   .   .   .   // [1,"f",'\''y'\'',[1,'\''z'\'']]
.   .   .   .   .   case '\''y'\'':
.   .   .   .   .   .   if (*p == 0)
.   .   .   .   .   .   .   return "cfgxy";
.   .   .   .   .   .   // [1,"f",'\''z'\'',[0]]
.   .   .   .   .   .   if (*p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p == 0)
.   .   .   .   .   .   .   return "cfgxyz";
.   .   .   .   .   .   return error;
.   .   .   .   .   // [1,"fzz",'\''z'\'',[0]]
.   .   .   .   .   case '\''z'\'':
.   .   .   .   .   .   if (*p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p ++ == '\''z'\'' &&
.   .   .   .   .   .   .   *p == 0)
.   .   .   .   .   .   .   return "cfgxzzz";
.   .   .   .   .   }
.   .   .   .   }
.   .   .   }
.   .   .   return error;
.   .   // [0,"g",'\''e'\'',[0]]
.   .   case '\''g'\'':
.   .   .   if (*p ++ == '\''e'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "cge";
.   .   }
.   }
.   return error;
$ print a abcd abcdefg h hijk|trie
.   // [2,'\''h'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[1,'\''b'\'']]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   // [0,"bc",'\''d'\'',[1,'\''e'\'']]
.   .   if (*p ++ == '\''b'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''d'\'') {
.   .   .   if (*p == 0)
.   .   .   .   return "abcd";
.   .   .   // [2,"bcef",'\''g'\'',[0]]
.   .   .   if (*p ++ == '\''e'\'' &&
.   .   .   .   *p ++ == '\''f'\'' &&
.   .   .   .   *p ++ == '\''g'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "abcdefg";
.   .   }
.   .   return error;
.   // [0,"",'\''h'\'',[1,'\''i'\'']]
.   case '\''h'\'':
.   .   if (*p == 0)
.   .   .   return "h";
.   .   // [0,"ij",'\''k'\'',[0]]
.   .   if (*p ++ == '\''i'\'' &&
.   .   .   *p ++ == '\''j'\'' &&
.   .   .   *p ++ == '\''k'\'' &&
.   .   .   *p == 0)
.   .   .   return "hijk";
.   }
.   return error;
$ print a abcd abcdefg abcdxyz h hijk|trie
.   // [2,'\''h'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[1,'\''b'\'']]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   // [0,"bc",'\''d'\'',[2,'\''x'\'']]
.   .   if (*p ++ == '\''b'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''d'\'') {
.   .   .   if (*p == 0)
.   .   .   .   return "abcd";
.   .   .   switch (*p ++) {
.   .   .   // [2,"bcef",'\''g'\'',[0]]
.   .   .   case '\''e'\'':
.   .   .   .   if (*p ++ == '\''f'\'' &&
.   .   .   .   .   *p ++ == '\''g'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "abcdefg";
.   .   .   .   return error;
.   .   .   // [2,"bcxy",'\''z'\'',[0]]
.   .   .   case '\''x'\'':
.   .   .   .   if (*p ++ == '\''y'\'' &&
.   .   .   .   .   *p ++ == '\''z'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "abcdxyz";
.   .   .   }
.   .   }
.   .   return error;
.   // [0,"",'\''h'\'',[1,'\''i'\'']]
.   case '\''h'\'':
.   .   if (*p == 0)
.   .   .   return "h";
.   .   // [0,"ij",'\''k'\'',[0]]
.   .   if (*p ++ == '\''i'\'' &&
.   .   .   *p ++ == '\''j'\'' &&
.   .   .   *p ++ == '\''k'\'' &&
.   .   .   *p == 0)
.   .   .   return "hijk";
.   }
.   return error;
$ print a abcd abcdefg abcdxyz h hijk hlm|trie
.   // [2,'\''h'\'']
.   switch (*p ++) {
.   // [0,"",'\''a'\'',[1,'\''b'\'']]
.   case '\''a'\'':
.   .   if (*p == 0)
.   .   .   return "a";
.   .   // [0,"bc",'\''d'\'',[2,'\''x'\'']]
.   .   if (*p ++ == '\''b'\'' &&
.   .   .   *p ++ == '\''c'\'' &&
.   .   .   *p ++ == '\''d'\'') {
.   .   .   if (*p == 0)
.   .   .   .   return "abcd";
.   .   .   switch (*p ++) {
.   .   .   // [2,"bcef",'\''g'\'',[0]]
.   .   .   case '\''e'\'':
.   .   .   .   if (*p ++ == '\''f'\'' &&
.   .   .   .   .   *p ++ == '\''g'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "abcdefg";
.   .   .   .   return error;
.   .   .   // [2,"bcxy",'\''z'\'',[0]]
.   .   .   case '\''x'\'':
.   .   .   .   if (*p ++ == '\''y'\'' &&
.   .   .   .   .   *p ++ == '\''z'\'' &&
.   .   .   .   .   *p == 0)
.   .   .   .   .   return "abcdxyz";
.   .   .   }
.   .   }
.   .   return error;
.   // [0,"",'\''h'\'',[2,'\''l'\'']]
.   case '\''h'\'':
.   .   if (*p == 0)
.   .   .   return "h";
.   .   switch (*p ++) {
.   .   // [0,"ij",'\''k'\'',[0]]
.   .   case '\''i'\'':
.   .   .   if (*p ++ == '\''j'\'' &&
.   .   .   .   *p ++ == '\''k'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "hijk";
.   .   .   return error;
.   .   // [0,"l",'\''m'\'',[0]]
.   .   case '\''l'\'':
.   .   .   if (*p ++ == '\''m'\'' &&
.   .   .   .   *p == 0)
.   .   .   .   return "hlm";
.   .   }
.   }
.   return error;'
) -L gen-compact-c-code-base-ternary.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ trie() { ../src/trie --gen=compact --output=c-code --attrs --dots --trie=ternary "$@"; }'
trie() { ../src/trie --gen=compact --output=c-code --attrs --dots --trie=ternary "$@"; } 2>&1 ||
echo 'command failed: trie() { ../src/trie --gen=compact --output=c-code --attrs --dots --trie=ternary "$@"; }'

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

