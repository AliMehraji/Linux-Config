#! /bin/bash

_kube_contexts()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ) );
}
