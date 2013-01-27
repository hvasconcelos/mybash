## Colorize the ls output ##
if [[ `uname -s` == 'Darwin' ]];then 
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
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
if [[ `uname -s` == 'Darwin' ]];then
  alias ports='netstat -anl -f inet -f inet6'
else
  alias ports='netstat -tulanp'
fi
alias df='df -H'
alias du='du -ch'
alias getpkey='cat ~/.ssh/id_rsa.pub'
