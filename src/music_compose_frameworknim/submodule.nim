import macros
import strformat
import std/strutils

proc getWelcomeMessage*(): string = "Hello, World!"

const ScorePrefix = "!"

func mkScoreEcho(stmtStr: string): string =
  var newStrBody = ""
  var newStmtStr = stmtStr

  newStrBody.add("echo \"\"\"")
  newStrBody.add(fmt"{newStmtStr}" & "\"\"\"")
  newStrBody.add("\n")

  return newStrBody

proc mkScoreBlock(body: NimNode, strBody: string): string {.compileTime.} =
  var newStrBody = strBody
  for stmt in body:
    var stmtStr = fmt"{repr(stmt)}"
    echo "stmtStr: ", stmtStr, "stmt.kind: ", stmt.kind
    if startsWith(stmtStr, ScorePrefix):
      stmtStr.removePrefix(ScorePrefix)
      newStrBody.add(mkScoreEcho(stmtStr))

    else:
      for stStr in stmtStr.split("\n"):
        let stStrIndentCounts = stStr.indentation()
        var stStrUnindented = stStr.unindent()
        if startsWith(stStrUnindented, ScorePrefix):
          stStrUnindented.removePrefix(ScorePrefix)
          newStrBody.add(mkScoreEcho(stStrUnindented).indent(stStrIndentCounts))
        else:
          newStrBody.add(stStr)
          newStrBody.add("\n")


  return newStrBody

macro mkScore*(name: untyped, body: untyped): untyped =
  var strBody = ""
  strBody.add(mkScoreBlock(body, strBody))
  echo "strBody: ", strBody
  parseStmt(fmt"""
proc {repr(name)}*() =
{strBody}"""
  )

mkScore Part1:
  ! l8 o5
  ! dd {dd}{cc}dd d{ff}gg gffg dd2
  for _ in 0..2:
    for _ in 0..2:
      for _ in 0..2:
        ! dd{ff}a bbb{ff}ga
        echo "a"
# [2 dd{ff}a bbb{ff} ga:> ]
# """
