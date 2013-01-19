# Helder Vasconcelos Mac Book Pro <heldervasc@bearstouch.com>
# .bash_rc
load_dir() {
  if [[ -d $1 ]]; then
    files=`find $1 -name *.bash`
    for file in $files; do
      . $file
    done
  else
    echo "Error: Failed to load directory $1"
  fi
}

export_dir_after() {
  export PATH=$PATH:$*
}

export_dir_before(){
  export PATH=$*:$PATH
}

set_profile(){
  if [[ -e $HOME/.bash/profiles/$1.bash ]]; then 
    echo $1 > $HOME/.bash/PROFILE
    . $HOME/.bash/profiles/$1.bash
  else
    echo "Error: Profile $1 doesn't exist" 
  fi
}

load_dir $HOME/.bash/plugin
load_dir $HOME/.bash/alias

if [[ -e /Users/heldervasconcelos/.profile ]]; then
    . /Users/heldervasconcelos/.profile
fi
