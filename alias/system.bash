## Colorize the ls output ##
`mybash_isMac` && alias ls='ls -G'
`mybash_isLinux` && alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -al'

## Show hidden files ##
alias l.='ls -d .* -G'
alias ..='cd ..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -p'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
	
`mybash_isMac` && alias ports='netstat -anl -f inet -f inet6'
`mybash_isLinux` && alias ports='netstat -tulanp'

alias df='df -H'
alias du='du -ch'
alias getpkey='cat ~/.ssh/id_rsa.pub'
alias fdosfiles="grep -Ilsr $'\r$'"
alias d2unix="cat $1 | col -b > $1"

`mybash_isLinux` && alias inclip="xclip -selection c -i"
`mybash_isMac` && alias inclip="pbcopy"
`mybash_isLinux` && alias outclip="xclip -selection c -o"
`mybash_isMac` && alias outclip="pbpaste"
