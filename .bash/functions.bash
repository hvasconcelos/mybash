# Helder Vasconcelos Mac Book Pro <heldervasc@bearstouch.com>
# .bash_rc
export PS1='[\[\e[1;34m\]\u@\h\[\e[0m\]..\W] '

myloaddir() {
  if [[ -d $1 ]]; then
    files=`find $1 -name *.bash`
    for file in $files; do
      #echo "Loading file: $file"
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
  echo "$1:$2" >> $HOME/.bash/IDIR
}

mylls(){
  dirs=`cat $HOME/.bash/IDIR`
  for entry in $dirs; do
    name=`echo $entry | awk -F : '{print $1}'`
    dir=`echo $entry | awk -F : '{print $2}'`
    echo "$name $dir"
  done
}

mylgo(){
  if [[ $1 ]]; then
    dirs=`cat $HOME/.bash/IDIR`
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

myprofset(){
  if [[ -e $HOME/.bash/profiles/$1 ]]; then 
    echo $1 > $HOME/.bash/PROFILE
    echo "Loading Profile [ $1 ]"
    . $HOME/.bash/profiles/$1
  else
    echo "Error: Profile $1 doesn't exist" 
  fi
}

myprofls(){
 for profile in `ls $HOME/.bash/profiles/`; do
    echo $profile
 done
}

> $HOME/.bash/IDIR
myloaddir $HOME/.bash/plugin
myloaddir $HOME/.bash/alias
