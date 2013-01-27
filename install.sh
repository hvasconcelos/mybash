#!/bin/bash
# my bash install script
# author: Helder Vasconcelos <heldervasc@bearstouch.com>

install_dir=$HOME/.mybash

first_time_install(){
  version=`cat .git/refs/remotes/origin/master`
  echo "Installing mybash on your system commit=[$version]"
  mkdir -p $install_dir 
  bash_login_files="$HOME/.bash_profile
                    $HOME/.bash_login 
                    $HOME/.profile"
  mkdir -p $install_dir
  cp -r * $install_dir/ 
  cp -r .git $install_dir/
  for bl in $bash_login_files; do
    if [[ -e $bl ]]; then 
      mybash_install=$(cat $bl  | grep -c ". \$HOME/.mybash/mybash.bash")
      if [[ $mybash_install -eq 0 ]]; then
        cat .bash_profile_temp >> $bl
      fi
      return 0
    fi
  done
  cat .bash_profile_temp > ${bash_login_files[0]}
}

install_files(){
  
  if [[ ! -e $install_dir ]]; then 
    first_time_install
  else
    cd $install_dir
    git fetch
    echo "Updating to $(cat .git/refs/remotes/origin/master)" 
    # TODO
  fi
}
install_files
