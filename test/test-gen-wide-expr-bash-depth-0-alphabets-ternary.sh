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
# $ gen-test -T gen-wide-expr-bash-depth-0-alphabets-ternary
#

[[ "$1" =~ ^-u[0-9]+$ ]] &&
u="${1:2}" ||
u=""

diff -u$u -L gen-wide-expr-bash-depth-0-alphabets-ternary.old <(echo \
'$ print() { printf '\''%s\n'\'' "$@"; }
$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }
$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }
$ ../src/trie --dots --gen=wide --output=expr --expr=bash --depth=0 --trie=ternary < alphabets.txt
{
.   a {
.   .   a,
.   .   f,
.   .   gq,
.   .   k,
.   .   m,
.   .   r,
.   .   s {,
.   .   .   a,
.   .   .   t
.   .   },
.   .   z {,
.   .   .   _Cyrl
.   .   }
.   },
.   b {
.   .   as,
.   .   e {,
.   .   .   m,
.   .   .   z
.   .   },
.   .   g,
.   .   m,
.   .   n,
.   .   o,
.   .   r {,
.   .   .   x
.   .   },
.   .   s {,
.   .   .   _Cyrl
.   .   },
.   .   yn
.   },
.   c {
.   .   a,
.   .   gg,
.   .   hr,
.   .   s,
.   .   y
.   },
.   d {
.   .   a {,
.   .   .   v
.   .   },
.   .   e,
.   .   je,
.   .   ua,
.   .   yo,
.   .   z
.   },
.   e {
.   .   bu,
.   .   e,
.   .   l,
.   .   n,
.   .   o,
.   .   s,
.   .   t,
.   .   u,
.   .   wo
.   },
.   f {
.   .   a,
.   .   f,
.   .   i {,
.   .   .   l
.   .   },
.   .   o,
.   .   r,
.   .   ur,
.   .   y
.   },
.   g {
.   .   a,
.   .   d,
.   .   l,
.   .   sw,
.   .   u {,
.   .   .   z
.   .   },
.   .   v
.   },
.   h {
.   .   a {,
.   .   .   w
.   .   },
.   .   e,
.   .   i,
.   .   r,
.   .   u,
.   .   y
.   },
.   i {
.   .   a,
.   .   d,
.   .   g,
.   .   i,
.   .   s,
.   .   t
.   },
.   j {
.   .   a,
.   .   go,
.   .   mc
.   },
.   k {
.   .   a {,
.   .   .   b,
.   .   .   m
.   .   },
.   .   de,
.   .   ea,
.   .   hq,
.   .   i,
.   .   k {,
.   .   .   j
.   .   },
.   .   l {,
.   .   .   n
.   .   },
.   .   m,
.   .   n,
.   .   o {,
.   .   .   k
.   .   },
.   .   s {
.   .   .   b,
.   .   .   f,
.   .   .   h
.   .   },
.   .   w,
.   .   y
.   },
.   l {
.   .   ag,
.   .   g,
.   .   kt,
.   .   n,
.   .   o,
.   .   t,
.   .   u {,
.   .   .   o,
.   .   .   y
.   .   },
.   .   v
.   },
.   m {
.   .   as,
.   .   er,
.   .   fe,
.   .   g {,
.   .   .   h,
.   .   .   o
.   .   },
.   .   k,
.   .   l,
.   .   n,
.   .   r,
.   .   s,
.   .   t,
.   .   ua,
.   .   y
.   },
.   n {
.   .   aq,
.   .   b,
.   .   d,
.   .   e,
.   .   l,
.   .   mg,
.   .   n {,
.   .   .   h
.   .   },
.   .   r,
.   .   so,
.   .   us,
.   .   yn
.   },
.   o {
.   .   m,
.   .   r,
.   .   s
.   },
.   p {
.   .   a {,
.   .   .   _Arab
.   .   },
.   .   l,
.   .   s,
.   .   t
.   },
.   r {
.   .   m,
.   .   n,
.   .   o {,
.   .   .   f
.   .   },
.   .   u,
.   .   w {,
.   .   .   k
.   .   }
.   },
.   s {
.   .   a {
.   .   .   h,
.   .   .   q
.   .   },
.   .   bp,
.   .   e {,
.   .   .   h,
.   .   .   s
.   .   },
.   .   g,
.   .   hi {,
.   .   .   _Latn
.   .   },
.   .   i,
.   .   k,
.   .   l,
.   .   n,
.   .   o,
.   .   q,
.   .   r {,
.   .   .   _Latn
.   .   },
.   .   s {,
.   .   .   y
.   .   },
.   .   t,
.   .   v,
.   .   w {,
.   .   .   c
.   .   }
.   },
.   t {
.   .   a,
.   .   e {,
.   .   .   o
.   .   },
.   .   g,
.   .   h,
.   .   i {,
.   .   .   _ER,
.   .   .   g
.   .   },
.   .   n,
.   .   o,
.   .   r,
.   .   s,
.   .   wq,
.   .   zm
.   },
.   u {
.   .   g,
.   .   k,
.   .   r,
.   .   z {,
.   .   .   _ {
.   .   .   .   Arab,
.   .   .   .   Cyrl
.   .   .   }
.   .   }
.   },
.   v {
.   .   ai_Latn,
.   .   e,
.   .   i,
.   .   o,
.   .   un
.   },
.   wa {
.   .   e,
.   .   l
.   },
.   x {
.   .   h,
.   .   og
.   },
.   y {
.   .   av,
.   .   o {,
.   .   .   _BJ
.   .   }
.   },
.   z {
.   .   gh,
.   .   h {,
.   .   .   _Hant
.   .   },
.   .   u
.   }
}'
) -L gen-wide-expr-bash-depth-0-alphabets-ternary.new <(
echo '$ print() { printf '\''%s\n'\'' "$@"; }'
print() { printf '%s\n' "$@"; } 2>&1 ||
echo 'command failed: print() { printf '\''%s\n'\'' "$@"; }'

echo '$ printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'
printc() { awk '{ printf("%c\n", strtonum("0x" $1)) }' <<< "$1"; } 2>&1 ||
echo 'command failed: printc() { awk '\''{ printf("%c\n", strtonum("0x" $1)) }'\'' <<< "$1"; }'

echo '$ trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'
trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r 's|^#|\\\0|'; } 2>&1 ||
echo 'command failed: trie0() { set -o pipefail && ../src/trie "$@" 2>&1|sed -r '\''s|^#|\\\0|'\''; }'

echo '$ ../src/trie --dots --gen=wide --output=expr --expr=bash --depth=0 --trie=ternary < alphabets.txt'
../src/trie --dots --gen=wide --output=expr --expr=bash --depth=0 --trie=ternary < alphabets.txt 2>&1 ||
echo 'command failed: ../src/trie --dots --gen=wide --output=expr --expr=bash --depth=0 --trie=ternary < alphabets.txt'
)

