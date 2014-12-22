#!/bin/bash


function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
  }
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
##export PS1='\u@\h:\w\[\e[1;36m\]$(parse_git_branch)\[\e[0m\]$ 


S1='\[\e[01;32m\]\u@\[\e[00m\]\[\e[01;34m\][\w]\[\e[00m\] >> '
export PS1

alias l='ls -CF';
alias ll='ls -l';
alias la='ls -a';

alias grep='grep --color'

man() {
	env \
		GROFF_NO_SGR=$(printf "1")	\
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

md ()	{	mkdir -p "$1"	&&	cd "$1";	}

# ECC android environment setup
# http://gwydlvm207.cisco.com/wiki/doku.php?id=enhancedcallcontrolapi:android_dev_env_setup&s[]=mac&s[]=setup

export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/"
export DEV_ENV_ROOT=$HOME/android/
export ANDROID_NDK_ROOT="${DEV_ENV_ROOT}/android-ndk-r8c/"
export ANDROID_SDK_ROOT="${DEV_ENV_ROOT}/android-sdk-macosx/"
#export ANDROID_TOOLCHAIN="${DEV_ENV_ROOT}/standalone-toolchain-api14/"
export ANDROID_NDK_HOME="$HOME/android/android-ndk-r8c"



export ANDROID_TOOLCHAIN="$ANDROID_NDK_HOME/standalone-toolchain-api14/"


export ANDROID_HOME="/Users/peli3/android/android-sdk-macosx/"

export PATH=$PATH:"${ANDROID_TOOLCHAIN}/bin/":"${ANDROID_HOME}/platform-tools/"
export PATH="$HOME/bin":$PATH



pathadd () {	export PATH="$1":$PATH;	}

dgrep () {	find "$2" \( -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.c' -or -iname '*.h' \) -exec grep -Hn --color "$1" {} \;	;}

alias mvim='mvim --remote-silent';

diff () { diff "$@"	;	}
#export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/

if [ -f "/Users/peli3/.git-completion.bash" ]; then
	. "/Users/peli3/.git-completion.bash"
fi

## https://linuxtoy.org/archives/bash_tricks.html
#shopt -s histappend 
#PROMPT_COMMAND='history -a'
#
