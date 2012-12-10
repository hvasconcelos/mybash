# .bash_rc
load_diretory() {

    if [ -e $1 ]; then
        files=`find $1 -name *.bash`
        for file in $files; do
            . $file
        done
    fi
}

PS1="[\u@\h]> "
load_diretory "$HOME/.bash/plugin"
load_diretory "$HOME/.bash/alias"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# User specific PATH Customizations
export PATH=$PATH:$HOME/bin:.
export CVSROOT=:ext:hvasconc@airtelcvs:/cvs
export JAVA_HOME=/usr/java/jdk1.7.0_07
export LSF_SOURCE=/home/heldervasc/Workspace/LSF/src
export AAS_WS=/home/heldervasc/Workspace/exports/aas_ws/
export ASE_RELEASE=/home/heldervasc/Workspace/exports/aas_ws/src/ase/
export EDITOR=vim
