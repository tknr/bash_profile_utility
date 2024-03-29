## https://qiita.com/neko_the_shadow/items/841bf59c4f80588baad7
ulimit -n 65535

## https://www.atmarkit.co.jp/flinux/rensai/linuxtips/357colorlsless.html
alias ls='ls --color=always --time-style long-iso'
alias ll='ls -l --color=always --time-style long-iso'
alias lh='ls -lh --color=always --time-style long-iso'
alias llh='lh'
export LESS='-R'

alias treeCNhD='tree -CNhD --timefmt "%F %H:%M"'
alias treecnhd='treeCNhD'

## https://qiita.com/SUZUKI_Masaya/items/3148b5f1d9fa9fdb3b51
#if type trash-put &> /dev/null
#then
#    alias rm=trash-put
#fi

if type progress &> /dev/null
then
    alias cv=progress
fi

## linuxbrew
if type /home/linuxbrew/.linuxbrew/bin/brew &> /dev/null
then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

## opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

## brew install bash-completion@2
[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh"


bitrate () {
	if type ffmpeg &> /dev/null
	then
        	echo `basename "${1}"`: `ffmpeg -hide_banner -i "${1}" 2>&1 | grep Audio | cut -d "," -f 5 | tr -d " kb/s"`
	else
		echo 'ffmpeg not found.'
	fi
}

find_empty_delete () {
        find ${1} -empty -delete
}
alias fed='find_empty_delete'

du_sort () {
	du -h -d 1 ${1} | sort -h -r
}

find_sort () {
	find ${1} -name "*${2}*" | sort -h
}

remove_ansi_escape_code() {
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g"
}
