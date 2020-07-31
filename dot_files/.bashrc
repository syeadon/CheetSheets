#alias fork="/C/Users/syeadon/AppData/Local/Fork/Fork.exe '$(pwd -W)'"
alias ll='ls -lah --color=always'
alias gh='history|grep'
alias gs='/F/Source/my-projects/syeadon-miscellany/GitHelpers/GitDirectoryStatus.sh'
alias gitmegoing='/F/Source/my-projects/syeadon-miscellany/GitHelpers/GitMeGoing.sh'
alias matrix='/F/Source/my-projects/Scripticus/shell/matrix.sh'

fork(){
  if [ "$#" -ne 1 ] || [ "$1" -eq '.' ]; then
    path=`pwd -W`
  else
  #to do fix linux path issues
    linuxPath=`readlink -f $1`
    path=$1
  fi
  
  #echo "/C/Users/syeadon/AppData/Local/Fork/Fork.exe '$path'"  
  /C/Users/syeadon/AppData/Local/Fork/Fork.exe "$path"
}

# Theme
THEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash
if [ -f $THEME ]; then
   . $THEME
fi
unset THEME
