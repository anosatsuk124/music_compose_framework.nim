# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import music_compose_framework/submodule
test "Check defScore":
  defScore Part1:
    n:
      "l8 o5"
      "dd {dd}{cc}dd d{ff}gg gffg dd2"
    n 2: "dd{ff}a bbb{ff}ga"
  check Part1() == """
l8 o5
dd {dd}{cc}dd d{ff}gg gffg dd2
dd{ff}a bbb{ff}ga
dd{ff}a bbb{ff}ga
"""
