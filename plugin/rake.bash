#!/usr/bin/env bash
_rake(){
  local cur
  local tasks=""
  COMPREPLY=()
  [[ -e ./Rakefile ]] && tasks=$(rake --tasks | cut -d ' ' -f 2 )
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "${tasks}" $cur))
}
complete -F _rake rake
