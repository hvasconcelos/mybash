# Helder Vasconcelos Mac Book Pro <heldervasc@bearstouch.com>
# .bash_rc
export PS1='[\[\e[1;34m\]\u@\h\[\e[0m\]..\W] '

myloaddir() {
  if [[ -d $1 ]]; then
    files=`find $1 -name *.bash`
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
  COMPREPLY=()
  [[ -e ~/.mybash/IDIR ]] && COMPREPLY=$(cat ~/.mybash/IDIR | cut -d ':' -f 1)
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

myisuptodate(){
  cd $HOME/.mybash
  git fetch -q origin 
  here=`cat $HOME/.mybash/.git/refs/heads/master`
  origin=`cat $HOME/.mybash/.git/refs/remotes/origin/master`
  if [[ $here != $origin ]]; then
    echo "Please update to version=[$origin]"
    #echo "Updating to $origin"
    #git pull origin master
  fi
  cd $HOME
}

> $HOME/.mybash/IDIR
myloaddir $HOME/.mybash/plugin
myloaddir $HOME/.mybash/alias
