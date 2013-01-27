#!/bin/bash
# my bash install script
# author: Helder Vasconcelos <heldervasc@bearstouch.com>

install_dir=$HOME/.mybash
install_log_file=$install_dir/mybash_install.log

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

update_local_code(){
    cd $install_dir
    git fetch >> $install_log_file
    remote_mcomm=$(cat .git/refs/remotes/origin/master)
    echo "Updating to $(cat .git/refs/remotes/origin/master)" 
    if [[ $(git push origin master) -ne 0 ]]; then 
       echo "Faileed to update code"
    else
       echo "Updated to version $remote_mcomm"
    fi
}

install_files(){
  
  if [[ ! -e $install_dir ]]; then 
    first_time_install
  else
    update_local_code
  fi
}
install_files
