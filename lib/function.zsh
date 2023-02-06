#!/usr/bin/env zsh

function cl() {
	DIR="$*"
	# if no DIR given, go home
	if [ $# -lt 1 ]; then
		DIR=$HOME
	fi
	builtin cd "${DIR}" &&
		# use your preferred ls command
		ls -F --color=auto
}

#delete and reclone remote repo
reclone() {
	basename=${PWD##*/}
	remoteurl=$(git remote get-url --push origin)
	cd ..
	echo $basename
	echo $remoteurl
	rm -rf $basename
	git clone $remoteurl
	cd $basename
}

# snakemake use all cores by default
sm() {
	if [[ $* == *"-j"* || $* == *"--jobs"* || $* == *"--cores"* ]]; then
		snakemake $@
	else
		snakemake -j all $@
	fi
}

function gi() {
	curl -sL "https://www.toptal.com/developers/gitignore/api/$@"
}

# make pdfs or svgs from vegalite json's
mkvegapdf() {
	vl2vg $1 | vg2pdf >$2
}

mkvegasvg() {
	vl2vg $1 | vg2svg >$2
}

# quick and dirty pdf generation from simple md
md2pdf() {
	root=$1
	# get extension and root path: https://stackoverflow.com/a/40928328
	fname="${root#.}"
	fname="${root%"$fname"}${fname%.*}"
	ext="${root#"$fname"}"
	echo "converting $root to pdf"

	if [[ $ext != ".md" ]]; then
		echo "error! expected a markdown file"
		echo "unrecognized extension: $ext"
		return 1
	fi

	pandoc -V geometry:a5paper -V geometry:margin=.5in --dpi=300 -o ${fname}.pdf $root

}

py2nb2html() {
	if [ $# -eq 0 ]; then
		echo "No arguments provided"
		return 1
	fi
	pyfile=$1
	shift
	echo "generating html file for $pyfile"
	jupytext --to notebook -o - $pyfile | jupyter nbconvert --execute --to html --stdin $@
}

alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}

format-qmd() {
	# TODO: add support for outputs
	jupytext --from qmd $1 --pipe black --opt 'notebook_metadata_filter=-all'
}

add-to-path () {
# $1 prepend/append
# $2 path
	! [[ -d "$2" ]] && return 0
	case ":$PATH:" in
		*":$2:"*) :;; # already there
		*)
		if [[ "$1" == 'prepend' ]]; then
			PATH="$2:$PATH"
		elif [[ "$1" == 'append' ]]; then
			PATH="$PATH:$2"
		else 
			echo "please specify append/prepend not $1"
		fi
		;;
	esac
}

print-paths() {
  sed 's/:/\n/g' <<< "$PATH"
}

ta () {
	tmux attach -t "$@"	|| tmux new-session -s "$@"
}

web () {
	if [[ -z "$BROWSER" ]]; then
		echo 'set $BROWSER'
		return
	fi
	for i
	do
		if [[ ! -r $i ]]
		then
			echo "$0: file doesn't exist: \`$i'" >&2
			continue
		fi
		$BROWSER "$i" > /dev/null 2>&1 &
		disown
	done
}
