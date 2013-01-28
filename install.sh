#!/bin/bash
# mybash install script
# author: Helder Vasconcelos <heldervasc@bearstouch.com>

install_dir=$HOME/.mybash
install_log_file=$install_dir/mybash_install.log

first_time_install(){
  version=`cat .git/refs/heads/master`
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
        cat mybash_init_template >> $bl
      fi
      return 0
    fi
  done
  cat .bash_profile_temp > ${bash_login_files[0]}
}

mybash_update(){
    cd $install_dir
    git fetch >> $install_log_file 2>&1
    remote_mcomm=$(cat .git/$(cat ~/.mybash/.git/refs/remotes/origin/HEAD | cut -d  ' ' -f 2 ))
    if [[ $(cat .git/refs/heads/master) != $remote_mcomm ]]; then 
      echo "Updating mybash to $remote_mcomm" 
      if [[ $(git pull -f origin master >> $install_log_file 2>&1) -ne 0 ]]; then 
        echo "Faileed to update mybash"
      fi
    else
      echo "mybash is up to date"
    fi 
    echo "Updated mybash sucessfully to version $remote_mcomm"
    cd $HOME
}

install_files(){
  
  if [[ ! -e $install_dir ]]; then 
    first_time_install
  else
    echo "mybash already installed"
    mybash_update
  fi
}
install_files
