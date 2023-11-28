import std/[os, strutils, strformat]

switch("hint","[Conf]:off")

proc forward_args(task_name: string): seq[string] =
  let args = command_line_params()
  let arg_start = args.find(task_name) + 1
  return args[arg_start..^1]

proc gorgeExCd(command: string, dir: string = getCurrentDir()): tuple[output: string, exitCode: int] =
  gorgeEx("cd $1 && $2" % [dir, command])

proc getGitRootMaybe(): string =
  ## Try to get the path to the current git root directory.
  ## Return ``projectDir()`` if a ``.git`` directory is not found.
  const
    maxAttempts = 10            # arbitrarily picked
  var
    path = projectDir() # projectDir() needs nim 0.20.0 (or nim devel as of Tue Oct 16 08:41:09 EDT 2018)
    attempt = 0
  while (attempt < maxAttempts) and (not dirExists(path / ".git")):
    path = path / "../"
    attempt += 1
  if dirExists(path / ".git"):
    result = path
  else:
    result = projectDir()

let
  root = getGitRootMaybe()
  (_, pkgName) = root.splitPath()
  srcFile = root / "src" / (pkgName & ".nim")

proc formatNimCode(pattern = r"^src/.*\.nim$") = 
  let srcFiles = gorgeExCd(fmt"nimgrep --filenames -r '{pattern}' --noColor").output.split("\n")[0..^2]
  for file in srcFiles:
    let cmd = "nimpretty $1" % [file]
    echo "Running $1 .." % [cmd]
    exec(cmd)

task fmt, "Run nimpretty on all git-managed .nim files in the current repo":
  ## Usage: nim fmt | nim fmt .
  let dirs = forward_args("fmt")
  if dirs.len == 0:
    formatNimCode()
  else:
    for dir in dirs:
      let pattern = fmt"^{dir}/.*\.nim$"
      formatNimCode(pattern)
  setCommand("nop")

task i, "install package":
  exec "nimble install"
  setCommand("nop")


task lexidInc, "bump lexigraphic id":
  let (vsn, code) = gorgeExCd("git describe --tags --always --dirty=-dev")
  if code != 0: 
    echo "is this a git repo?"
    echo &"output: {vsn}"
    quit 1
  let
    parts = vsn.split(".")
    year = parts[0].replace("v","")
    build = parts[1]

  if "-dev" in build:
    echo "warning! uncommitted work, stash or commit"
    quit 1

  var next = $(parseInt(build) + 1)
  if build[0] < next[0]:
    next = $(parseInt($next[0])*11) & next[1..^1]

  let newVersion = &"{year}.{next}"

  when defined(commit):
    exec &"sed -i 's/version       = .*/version       = \"{newVersion}\"/' {pkgName}.nimble"
    exec &"git add {pkgName}.nimble"
    exec &"git commit -m 'chore: bump {year}.{build} -> {newVersion}'"
    exec &"git tag v{newVersion}"
  else:
    echo "next version is: ", newVersion,"\n"


