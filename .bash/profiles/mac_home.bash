[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Android SDK Enviromment
export ANDROID_HOME=/Users/heldervasconcelos/Desktop/Droid/android-sdk-mac_x86
export_dir_after /Users/heldervasconcelos/Desktop/Android/sdk/tools
export_dir_after /Users/heldervasconcelos/Desktop/Android/sdk/platform-tools
export_dir_after /Users/heldervasconcelos/Desktop/Android/android-ndk-r8c
export_dir_after ~/Desktop/Android/android-kernels/prebuilt/darwin-x86/toolchain/arm-eabi-4.4.3/bin
export_dir_after ~/bin
export_dir_before /usr/rlocal/sbin
export_dir_before /usr/local/bin
export_dir_after /usr/local/share/npm/bin
export EDITOR='/bin/vim'
alias gotop='cd ~/Desktop/beartouch/Projects'
iladd projs /Users/heldervasconcelos/Desktop/beartouch/Projects
iladd blib /Users/heldervasconcelos/Desktop/beartouch/Libraries
iladd smss ~/Desktop/beartouch/Projects/sms_scheduler_git
iladd ddserver ~/Desktop/beartouch/Projects/droidserver/
export PS1='[\[\e[1;34m\]\u@macbookpro\[\e[0m\]..\W] '
