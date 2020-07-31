#!/bin/bash

declare -A repos

# Git repos to follow
repos['FolderName1']="http://some-repo1.git"
repos['FolderName2']="http://some-repo1.git"


root=`pwd`

C_RED="\033[1;31m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_BLUE="\033[1;34m"
C_PURPLE="\033[1;35m"
C_CYAN="\033[1;36m"
C_RESET="$(tput sgr0)"

for key in "${!repos[@]}";
do
  if [ ! -d "$key" ]; then
    printf "${C_RED}${key} Does not exist Cloneing ${repos[$key]}${C_RESET} \n"
    git clone ${repos[$key]} "$key"
  fi

  cd "$key"
  wd=`pwd`

  b=`git rev-parse --abbrev-ref HEAD`
  printf "${C_GREEN}Processing repo ${wd} ${C_PURPLE}[${b}]${C_GREEN} ...${C_RESET} \n"
  
  printf "${C_YELLOW}Performing git fetch...${C_RESET} \n"
  git fetch --all
  
  printf "${C_YELLOW}Performing git pull...${C_RESET} \n"
  git pull  
  printf " \n"
  printf " \n" 
  cd "$root"
done

read -p "Press [Enter] key to end..."

