## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -al -d .* --color=auto'

## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias ..='cd ..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -p'

# install  colordiff package :)
alias diff='colordiff'

alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'

alias ports='netstat -tulanp'

alias df='df -H'
alias du='du -ch'

