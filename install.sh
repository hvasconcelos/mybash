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

mybash_update(){
    cd $install_dir
    git fetch >> $install_log_file 2>&1
    remote_mcomm=$(cat .git/refs/remotes/origin/master)
    if [[ $(cat .git/refs/heads/master) != $(cat .git/refs/remotes/origin/master) ]]; then 
      echo "Updating mybash to $(cat .git/refs/remotes/origin/master)" 
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
  echo "mybash version =$(cat .git/refs/heads/master)"
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
