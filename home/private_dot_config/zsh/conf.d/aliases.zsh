#
# aliases - Set whatever Zsh aliases you want.
#

# single character aliases - be sparing!
alias g=git

# mask built-ins with better defaults
alias vi=vim

# this one is kinda dangerous
alias rr="rm -rf"

# more ways to ls
alias ls="${aliases[ls]:-ls} --group-directories-first --color=auto"
alias l='ls -lh'
alias la='ls -a'
alias ldot='ls -ld .*'
alias lr='ls -R'
alias lsl="ls -lhFA --color=always | less"
alias left='ls -t -1'

# GNU make
alias mkrt='make -C $(git rev-parse --show-toplevel)'
alias mk="make"
alias mkc="make -C"

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

alias rclone='rclone --filter-from ~/.config/rclone/filter-file.txt'

# alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'
alias dots='cd ${DOTFILES_DIR:-~/.dotfiles}'
alias today="date +'%Y-%m-%d'"
alias dots-drop='chezmoi forget --interactive $(chezmoi managed -p absolute | fzf)'

