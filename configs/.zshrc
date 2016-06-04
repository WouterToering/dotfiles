export EDITOR='nvim'

#
# Aliases
#
alias g='git'
alias p='python'
alias pinst='pip install -e .'
alias ll='gls -lah --color=auto --group-directories-first'
alias l=ll

# COLOURS!
export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[\[\e[35m\]${BRANCH}${STAT}\[\e[m\]]"
	else
		echo ""
	fi
}

# NEW STUFF


PROMPT="[%F{yellow}%*%F{default}] [%F{green}%n@X%F{default}] [%F{blue}%~%F{default}]
"

alias f5='source ~/.zshrc'
