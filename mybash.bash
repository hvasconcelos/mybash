# Helder Vasconcelos Mac Book Pro <heldervasc@bearstouch.com>
# .bash_rc
export PS1='[\[\e[1;34m\]\u@\h\[\e[0m\]..\W] '

install_dir=$HOME/.mybash
install_log_file=$install_dir/mybash_install.log

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

mybash_update(){
    cd $install_dir
    git fetch >> $install_log_file 2>&1
    remote_mcomm=$(cat $install_dir/.git/refs/remotes/origin/master)
    if [[ $(cat $install_dir/.git/refs/heads/master) != $(cat $install_dir/.git/refs/remotes/origin/master) ]]; then
      echo "Updating mybash to $(cat $install_dir/.git/refs/remotes/origin/master)" 
      if [[ $(git pull -f origin master >> $install_log_file 2>&1 ) -ne 0 ]]; then
        echo "Faileed to update mybash"
        return 1
      fi
    else
      echo "mybash is up to date"
      return 0
    fi
    echo "Updated mybash sucessfully to version $remote_mcomm"
    return 0
}
mybash_version(){
  echo "mybash version =$(cat $install_dir/.git/refs/heads/master)"
}
mybash_update
> $HOME/.mybash/IDIR
myloaddir $HOME/.mybash/plugin
myloaddir $HOME/.mybash/alias
