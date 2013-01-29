#!/bin/bash
# mybash  script
# author: Helder Vasconcelos 

mybash_update(){

    cd $install_dir
    git fetch >> $install_log_file 2>&1
    remote_mcomm=$(cat .git/$(cat ~/.mybash/.git/refs/remotes/origin/HEAD | cut -d  ' ' -f 2 ))
    if [[ $(cat .git/refs/heads/master) != $remote_mcomm ]]; then 
        mybash_updaterepo $remote_mcomm
    else
      echo "mybash is up to date"
    fi 
    cd $HOME
}

mybash_updaterepo(){

    echo "Updating mybash to $1" 
    git stash >> $install_log_file 2>&1
    if [[ $(git pull -f origin master >> $install_log_file 2>&1) -ne 0 ]]; then 
        echo "Error: Faileed to update mybash to version $1"
        echo "Please verify the install log file $install_log_file"
    else
        echo "Succesfully Updated mybash to version $1"
    fi
    git stash pop >> $install_log_file 2>&1

}
