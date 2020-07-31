#https://git-scm.com/docs/git-status
#https://github.com/jaspernbrouwer/powerline-gitstatus/blob/1f3e0475385d8a7a149d56ffa12dfd2c386c1770/powerline_gitstatus/segments.py#L163


#Bold colours
#https://gist.github.com/vratiu/9780109
C_RED="\033[1;31m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_BLUE="\033[1;34m"
C_PURPLE="\033[1;35m"
C_CYAN="\033[1;36m"
C_WHITE="\033[1;37m" 
C_RESET="$(tput sgr0)"

branch=""
behind=0
ahead=0
ds=0 #Deleted and staged
du=0 #Deleted but not staged
cs=0 #Changed and staged
cu=0 #Changed but not staged
a=0  #Added and staged
u=0  #Added but untracked

wd=`pwd`  
status=`git status --branch --porcelain`

# echo $wd
# git status --branch --porcelain

IFS=$'\n'
for line in $status
do
	### status
	if [[ $line =~ ^[#]+[[:space:]].* ]]; then
		#echo "$line"
		#tracking a branch
		if [[ $line == *"..."* ]]; then
			branch=`echo $line | sed 's/##\s\(.*\)\.\.\..*/\1/g'`
			tempBehind=`echo $line | sed 's/##.*\[.*behind\s\(.*\)\]/\1/g'`
			tempAhead=`echo $line | sed 's/##.*\[ahead\s\(.*\)\].*/\1/g'`
			if [[ $tempBehind =~ ^[0-9]+$ ]]; then
				behind=$tempBehind
			fi
			if [[ $tempAhead =~ ^[0-9]+$ ]]; then
				ahead=$tempAhead
			fi
		else
			branch=`echo "$line" | sed 's/#//g' | sed 's/ //'`
		fi
	#?? foo.txt
	elif [[ $line =~ ^[?]+[[:space:]].* ]]; then
		let "u++"
	#M foo.txt
	elif [[ $line =~ ^M[[:space:]].* ]]; then
		let "cs++"
	# M foo.txt
	elif [[ $line =~ ^[[:space:]]M[[:space:]].* ]]; then
		let "cu++"
	#A foo.txt
	elif [[ $line =~ ^A[[:space:]].* ]]; then
		let "a++"
	#D foo.txt
	elif [[ $line =~ ^D[[:space:]].* ]]; then
		let "ds++"
	# D foo.txt
	elif [[ $line =~ ^[[:space:]]D[[:space:]].* ]]; then
		let "du++"
	else
		echo "wtf ${line}"
	fi	
done

if [ $branch == 'master' ]; then
	BranchColour=$C_BLUE
elif [ $branch == 'develop' ]; then
	BranchColour=$C_PURPLE
else
	BranchColour=$C_CYAN
fi

printf "${wd} ${C_YELLOW}[${BranchColour}${branch}${C_YELLOW} ↓${behind} ↑${ahead} ${C_GREEN}+${a} ~${cs} -${ds} ${C_YELLOW}| ${C_RED}+${u} ~${cu} -${du} !${C_YELLOW}]${C_RESET}\n"