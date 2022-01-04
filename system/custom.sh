# env variables
if ! [ $(cat /etc/hostname)=="thinkpad" ];then
    export BROWSER=/mnt/c/Users/daylin/AppData/Local/Vivaldi/Application/vivaldi.exe
else
    export BROWSER=vivaldi-stable
fi
# aliases
alias files=explorer.exe

