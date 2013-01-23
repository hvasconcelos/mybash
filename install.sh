#!/bin/bash
# my bash install script
# author: Helder Vasconcelos <heldervasc@bearstouch.com>

install_dir=$HOME/.mybash

link_files(){
  
  ln -sf $install_dir/.bash_profile ~/.bash_profile
  ln -sf $install_dir/.bash ~/.bash
}

backup(){
  
  files_to_backup="$HOME/.bash_profile \
                  $HOME/.bash \
                  $HOME/.mybash"

  for file in $files_to_backup; do 
    if [[ -h $file ]]; then
       echo "Removing Symlink=$file "
       rm -f $file
    elif [[ -e $file ]]; then 
        echo "Backing Up $file to $file.back"
        rm -rf $file.back
        mv $file $file.back
    fi
  done
}

install_files(){
  
  mkdir -p $install_dir
  files_to_install=".bash_profile \
                  .bash \
                  .git"

  for file in $files_to_install; do
    echo "Installing $file..."
    cp -rf $file $install_dir/$file     
  done
}

version=`cat .git/refs/remotes/origin/master`
echo "Installing mybash on your system commit=[$version]"
backup
install_files
link_files
