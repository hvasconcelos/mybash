# Author: Helder Vasconcelos <heldervasc@bearstouch.com>
# In Bash Shell Initialization process the first file found from the next 
# list is executed automatically at login: 
# 1. ~/.bash_profile 
# 2. ~/.bash_login  
# 3. ~/.profile.

. $HOME/.bash/functions.bash

# Initialize with profile mac_home
set_profile mac_home

#Execute the .bashrc if exists
[[ -f ~/.bashrc ]] && . ~/.bashrc
