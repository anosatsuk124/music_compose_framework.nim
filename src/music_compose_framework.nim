# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import music_compose_framework/submodule

defScore Part1:
  n:
    "l8 o5"
    "dd {dd}{cc}dd d{ff}gg gffg dd2"
  n 2: "dd{ff}a bbb{ff}ga"

proc main: void =
  echo Part1()

when isMainModule:
  main()
