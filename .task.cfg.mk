GOAL_STYLE = b_magenta
HELP_SEP = {a.b_green}->>{a.end}
USAGE = {a.italic}{a.b_cyan}Best Dots Around{a.end}\n
PHONIFY = 1

-include .task.mk
$(if $(wildcard .task.mk),,.task.mk: ; @curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/main/task.mk -o .task.mk 2>/dev/null || echo "no curl, skipping task.mk download")
