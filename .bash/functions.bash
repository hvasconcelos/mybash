# Helder Vasconcelos Mac Book Pro <heldervasc@bearstouch.com>
# .bash_rc
load_dir() {
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

export_dir_after() {
  export PATH=$PATH:$*
}

addidir(){
  echo "$1:$2" >> $HOME/.bash/IDIR
}

lidir(){
  dirs=`cat $HOME/.bash/IDIR`
  for entry in $dirs; do
    name=`echo $entry | awk -F : '{print $1}'`
    dir=`echo $entry | awk -F : '{print $2}'`
    echo "$name $dir"
  done
}

goto(){
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

export_dir_before(){
  export PATH=$*:$PATH
}

set_profile(){
  if [[ -e $HOME/.bash/profiles/$1.bash ]]; then 
    echo $1 > $HOME/.bash/PROFILE
    echo "Loading Profile [ $1 ]"
    . $HOME/.bash/profiles/$1.bash
  else
    echo "Error: Profile $1 doesn't exist" 
  fi
}

list_profiles(){
 for profile in `ls $HOME/.bash/profiles/`; do
    echo $profile
 done
}

> $HOME/.bash/IDIR
load_dir $HOME/.bash/plugin
load_dir $HOME/.bash/alias

if [[ -e $HOME/.profile ]]; then
    . $HOME/.profile
fi
