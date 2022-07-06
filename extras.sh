#! /usr/bin/env bash
# script to install the extra needed tools programmatically

# add command line flags and function to govern install?

MAMBAFORGE_RELEASE="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
MAMBAFORGE_INSTALLER="Mambaforge-Linux-x86_64.sh"

help() {
	cat <<EOF
extras downloaders

by default will download all packages listed below

usage: $0 [OPTIONS]

    --help               Show this message
    --force              Overwrite current installations

    To install a subset of these
    use any of the package specific flag:

    --fzf
    --nvm
    --mambaforge

EOF
}

for opt in "$@"; do
	case $opt in
	--help)
		help
		exit 0
		;;
	--force) force=1 ;;
	--fzf) fzf=1 ;;
	--nvm) nvm=1 ;;
	--mambaforge) mamba=1 ;;
	*)
		echo "unknown option: $opt"
		help
		exit 1
		;;
	esac
done

check_existing() {
	pkg=$1
	install_dir=$2
	declare -n skip_out=$3

	if [ -d "$install_dir" ]; then
		echo "found existing $pkg installation"
		if [[ "$force" ]]; then
			echo "removing previous installation"
			rm -rf $install_dir
			skip_out=0
		else
			skip_out=1
		fi
	else
		skip_out=0
	fi
}

ask() {
	while true; do
		read -p "$1 ([y]/n) " -r
		REPLY=${REPLY:-"y"}
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			return 1
		elif [[ $REPLY =~ ^[Nn]$ ]]; then
			return 0
		fi
	done
}

install_fzf() {
	echo "##############"
	echo installing fzf
	echo "##############"

	check_existing "fzf" "$HOME/.fzf" skip

	if [[ $skip -eq 1 ]]; then
		echo "remove your previous installation or rerun with --force"
		return
	fi

	echo "installing fzf using git"

	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install \
		--key-bindings \
		--completion \
		--no-bash \
		--no-zsh \
		--no-update-rc

}

install_nvm() {
	echo "##############"
	echo installing nvm
	echo "##############"

	check_existing "nvm" "$HOME/.nvm" skip

	if [[ $skip -eq 1 ]]; then
		echo "remove your previous installation or rerun with --force"
		return
	fi

	local current_dir=$PWD

	git clone https://github.com/nvm-sh/nvm.git ~/.nvm
	cd ~/.nvm
	git checkout v0.39.0
	. ./nvm.sh

	cd $current_dir
}

install_mambaforge() {
	echo "#####################"
	echo installing mambaforge
	echo "#####################"

	check_existing "mambaforge" "$HOME/mambaforge" skip

	if [[ $skip -eq 1 ]]; then
		echo "remove your previous installation or rerun with --force"
		return
	fi

	echo "fetching install script from github"

	current_dir=$PWD

	cd ~/

	wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
	bash "$MAMBAFORGE_INSTALLER" -s
	rm "$MAMBAFORGE_INSTALLER"

	echo "cleaning up installer"

	cd $current_dir
}

install_all() {
	echo "installing all packages..."
	echo
	install_fzf
	echo
	install_nvm
	echo
	install_mambaforge

}

# remove once functional
echo $@

echo "#################"
echo EXTRAS DOWNLOADER
echo "#################"
echo

if [ $# -eq 0 ]; then
	install_all
	exit
fi

if [ "$fzf" ]; then
	install_fzf
fi

if [ "$nvm" ]; then
	install_nvm
fi

if [ "$mamba" ]; then
	install_mambaforge
fi

echo "FINISHED!"
