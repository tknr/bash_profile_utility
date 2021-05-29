## https://qiita.com/neko_the_shadow/items/841bf59c4f80588baad7
ulimit -n 65535

## https://qiita.com/SUZUKI_Masaya/items/3148b5f1d9fa9fdb3b51
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

if type progress &> /dev/null
then
    alias cv=progress
fi

## snap
export PATH="$PATH:/var/lib/snapd/snap/bin"

## linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


bitrate () {
        echo `basename "${1}"`: `ffmpeg -hide_banner -i "${1}" 2>&1 | grep Audio | cut -d "," -f 5 | tr -d " kb/s"`
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
        mv -v "${1}" `echo "${1}"|nkf -m0Z1 -W -w`
}

treeNhD () {
	tree -NhD
}
