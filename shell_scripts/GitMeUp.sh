#!/bin/bash

C_RED="\033[1;31m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_BLUE="\033[1;34m"
C_PURPLE="\033[1;35m"
C_CYAN="\033[1;36m"
C_RESET="$(tput sgr0)"

find . -maxdepth 10 -name .git -type d -prune | while read d; do
  owd=`pwd`
  cd "${d}/.."
  nwd=`pwd`
  b=`git rev-parse --abbrev-ref HEAD`
  
  printf "${C_PURPLE}[${b}] ${C_GREEN}${nwd} ...${C_RESET} \n"
  
  if [[ $1 == 'pull' ]]; then
    printf "${C_YELLOW}Pulling...${C_RESET} \n"
    git pull --quiet
  else
    printf "${C_YELLOW}Fetching...${C_RESET} \n"
    git fetch --all 2>&1 > /dev/null
  fi
  
  ./gitStatus.sh
  
  printf "\n"
  cd "${owd}"
done