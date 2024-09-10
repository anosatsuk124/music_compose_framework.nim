import macros
import strformat
import std/strutils
import std/options

proc getWelcomeMessage*(): string = "Hello, World!"

const ScorePrefix = "!"

func mkScoreEcho(stmtStr: string): string =
  var newStrBody = ""
  var newStmtStr = stmtStr

  newStrBody.add("echo \"\"\"")
  newStrBody.add(fmt"{newStmtStr}" & "\"\"\"")
  newStrBody.add("\n")

  return newStrBody

func mkScoreBlock(body: NimNode): string {.compileTime.} =
  var newStrBody = ""
  for stmt in body:
    expectKind(stmt, nnkStrLit)
    newStrBody.add(stmt.strVal&"\n")

  return newStrBody

macro n*(body: untyped): untyped =
  var strBody = ""
  strBody.add(mkScoreBlock(body))
  parseStmt("\"\"\""&strBody&"\"\"\"")

macro n*(arg: untyped, body: untyped): untyped =
  var strBody = ""
  expectKind(arg, nnkIntLit)
  let n = arg.intVal
  for i in 0..<n:
    strBody.add(mkScoreBlock(body))
  parseStmt("\"\"\""&strBody&"\"\"\"")

macro defScore*(body: untyped): untyped =
  var newBody = newNimNode(nnkBracket)
  for stmt in body:
    newBody.add(stmt)
  quote do:
    join(`newbody`)

macro defScore*(name: untyped, body: untyped): untyped =
  var newBody = newNimNode(nnkBracket)
  for stmt in body:
    newBody.add(stmt)
  quote do:
    proc `name`(): string =
      return join(`newbody`)
