if [[ `uname -s` == 'Darwin' ]];then
     alias dos2unix='cat $1 | col -b > $1'
fi
