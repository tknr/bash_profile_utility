## https://qiita.com/neko_the_shadow/items/841bf59c4f80588baad7
ulimit -n 65535

## https://www.atmarkit.co.jp/flinux/rensai/linuxtips/357colorlsless.html
alias ls='ls --color=always --time-style long-iso'
alias ll='ls -l --color=always --time-style long-iso'
alias llh='ls -lh --color=always --time-style long-iso'
export LESS='-R'

alias treeCNhD='tree -CNhD --timefmt "%F %H:%M"'

## https://qiita.com/SUZUKI_Masaya/items/3148b5f1d9fa9fdb3b51
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

if type progress &> /dev/null
then
    alias cv=progress
fi

## linuxbrew
if type /home/linuxbrew/.linuxbrew/bin/brew &> /dev/null
then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

## snap
export PATH="$PATH:/var/lib/snapd/snap/bin"

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

f_e_d () {
        find_empty_delete ${1}
}

f-e-d () {
	find_empty_delete ${1}
}

du_sort_more () {
        du -h -d 1 ${1} | sort -h -r | more
}

d_s_m () {
        du_sort_more ${1}
}

d-s-m () {
	du_sort_more ${1}
}

find_sort_more () {
        find ${1} -name "*${2}*" | sort -h | more
}

f_s_m () {
        find_sort_more ${1} ${2}
}

f-s-m () {
	find_sort_more ${1} ${2}
}

rename_zen2han() {
	src=${1}
	dst=`echo "${1}"|nkf -e |  nkf -m0Z1 -w`
	dst=`echo "${dst}" | sed -e "s/\//／/g"`
	echo $src" -> "$dst
        mv -v "${src}" "${dst}"
}

remove_ansi_escape_code(){
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g"
}
