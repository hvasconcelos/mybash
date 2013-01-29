#!/bin/bash
# mybash main script
# author: Helder Vasconcelos <heldervasc@bearstouch.com>

export PS1='[\[\e[1;34m\]\u@\h\[\e[0m\]..\W] '

install_dir=$HOME/.mybash
install_log_file=$install_dir/mybash_install.log

. $install_dir/installf.bash

myloaddir() {
  if [[ -d $1 ]]; then
    files=`find $1 -iname  "*.bash"` 
    for file in $files; do
      . $file
    done
  else
    echo "Error: Failed to load directory $1"
  fi
}

myexpa() {
  export PATH=$PATH:$*
}

myexpb(){
  export PATH=$*:$PATH
}

myladd(){
  echo "$1:$2" >> $HOME/.mybash/IDIR
}

mylls(){
  dirs=`cat $HOME/.mybash/IDIR`
  for entry in $dirs; do
    name=`echo $entry | awk -F : '{print $1}'`
    dir=`echo $entry | awk -F : '{print $2}'`
    echo "$name $dir"
  done
}

mylgo(){
  if [[ $1 ]]; then
    dirs=`cat $HOME/.mybash/IDIR`
    for entry in $dirs; do
      name=`echo $entry | awk -F : '{print $1}'`
      dir=`echo $entry | awk -F : '{print $2}'`
      if [[ $name == $1 ]];then 
        cd $dir
        return 
      fi
    done
    echo "Error: Directory entry not found"
  else
    echo "Syntax Error: goto <dir_entry>"
  fi
}

_mylgo(){
  local cur
  local locals=""
  COMPREPLY=()
  [[ -e $HOME/.mybash/IDIR ]] && locals=$(cat $HOME/.mybash/IDIR | cut -d ':' -f 1)
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "${locals}" $cur))
}
complete -F _mylgo mylgo

myprofset(){
  if [[ -e $HOME/.mybash/profiles/$1.bash ]]; then 
    echo $1 > $HOME/.mybash/PROFILE
    echo "Loading Profile [ $1 ]"
    . $HOME/.mybash/profiles/$1.bash
  else
    echo "Error: Profile $1 doesn't exist" 
  fi
}

myprofls(){
 for profile in `ls $HOME/.bash/profiles/*.my`; do
    echo $profile
 done
}

mybash_version(){
  echo "mybash version =$(cat $install_dir/.git/refs/heads/master)"
}
mybash_update
> $HOME/.mybash/IDIR
myloaddir $HOME/.mybash/plugin
myloaddir $HOME/.mybash/alias
