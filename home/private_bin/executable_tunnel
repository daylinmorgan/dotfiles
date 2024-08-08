#!/usr/bin/env nu

use std log

def start-ssh-controller [host: string] {
   log info $"initializing connection to ($host)"
   ssh -M -f -N $host
}

def is-null [ name: string, arg: any] {
  if $arg == null {
    log error $"expected argument for --($name)"; exit 1
  }
}

# script `--help` will improve :)
# https://github.com/nushell/nushell/pull/13445

# control background tunnels
# usage:
#   tunnel up -p 4321 computer
#   tunnel down computer
def main [] {
  print "use subcommands up/down to control ssh tunnels"
  help main
}

# activate ssh tunnel
def "main up" [
  host: string   # host name
  --port: int    # port number
] {
  is-null "port" $port

  if (ssh -O check $host | complete).exit_code != 0 {
    start-ssh-controller $host
  }
  ssh -fNL $"($port):localhost:($port)" $host
}

# shutdown ssh tunnels on host
def "main down" [
  host: string   # host name
] {
  log info $"exiting connection to ($host)"
  ssh -O exit $host
}

def "main show" [] {
  let sockets = (
    ls ~/.ssh/
    | where name =~ control
    | get name
  )
  let n_sockets = $sockets | length
  if $n_sockets > 0 {
    print $"($n_sockets) active connections"
    $sockets
    | split column "-"
    | get column2
  } else {
    log info "no open connections"
  }
}
