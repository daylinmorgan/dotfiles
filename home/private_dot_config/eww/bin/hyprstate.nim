import std/[os,net, json, sugar, enumerate, strformat, tables]

const NUM_WORKSPACES = 8

let icons = {
        "[Running] - Oracle VM VirtualBox": "",
        "Visual Studio Code": "",
        "vivaldi-stable": "󰖟",
        "LibreOffice": "",
        "Geneious Prime": "󰚄",
        "Firefox": "",
        "- NVIM": "",
        "Alacritty": "",
        "- Wezterm": "",
}.toTable


type
  HyprlandDefect* = Defect

  Workspace = object
    id, monitorID, windows: int
    name, monitor, lastwindow, lastwindowtitle: string
    hasfullscreen: bool

  WorkspaceIcon = object
    id: int
    icon, class: string

  ActiveWorkspace = object
    id: int
    name: string

  Monitor = object
    id: int
    activeWorkspace: ActiveWorkspace

  Client = object
    workspace: ActiveWorkspace
    class, title: string


proc getData(data: string): string =
  let
    his = getenv("HYPRLAND_INSTANCE_SIGNATURE")
    socketPath = "/tmp/hypr" / his / ".socket.sock"

  let socket = newSocket(AF_UNIX, SOCK_STREAM, IPPROTO_IP)
  try:
    socket.connectUnix(socketPath)
  except OSError:
    raise newException(HyprlandDefect, "Could not connect to Hyprland IPC UNIX path; is Hyprland running?")

  socket.send(data)
  let response = socket.recv(4096)
  socket.close() # is this necessary?
  return response

proc getDefaultWorkspaces(): seq[WorkspaceIcon] =
  let clients = parseJson(getData("[-j]/clients")).to(seq[Client])
  result = collect(for i in 1..9: WorkspaceIcon(id: i, icon:"",class:fmt"ws-button-{i - 1}"))
  for client in clients:
    let match = icons.getOrDefault(client.class,"")
    result[client.workspace.id - 1].icon &= match


  for ws in result.mitems:
    if ws.icon == "":
      ws.icon = ""


proc getState(): seq[seq[WorkspaceIcon]] =
  let monitors = parseJson(getData("[-j]/monitors")).to(seq[Monitor])
  let workspaces = parseJson(getData("[-j]/workspaces")).to(seq[Workspace])

  let defaultWorkspaces = getDefaultWorkspaces()
  for monitor in monitors:
    result.add defaultWorkspaces
    result[monitor.id][monitor.activeWorkspace.id - 1].class &= " " & "ws-button-open" 


when isMainModule:
  while true:
    sleep 500
    echo (%* getState())
