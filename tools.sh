#!/usr/bin/env bash

BIN_DIR=$HOME/bin
mkdir -p $BIN_DIR
EGET_BIN=$BIN_DIR

post_download_install() {

    tool=$1
    temp_file=$(mktemp -p . ${tool}.XXX.sh)
    key=$tool yq e 'explode(.) | .[env(key)].post-download' $YAMLDOC > $temp_file
    . $temp_file
    rm $temp_file

}

if ! $(is-executable eget); then
	echo "I don't see eget on your path..."
	read -p "Do you want to download it to ${BIN_DIR}? " -n 1 -r
	echo    # (optional) move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		exit 1
	else
		curl https://zyedidia.github.io/eget.sh | sh
		mv eget $BIN_DIR/eget
	fi
fi

echo "downloading binaries from github to $EGET_BIN"

if ! $(is-executable yq); then
    eget mikefarah/yq --asset yq_linux_amd64
fi

YAMLDOC="info/tools.yml"
alias eget="eget --system linux/amd64"

readarray tools < <(yq e 'keys | .[]' $YAMLDOC)

for tool in "${tools[@]:1}"
do
    echo $tool

    user=$(key=$tool yq e 'explode(.) | .[env(key)].user' $YAMLDOC)
    asset=$(key=$tool yq e 'explode(.) | .[env(key)].asset // ""' $YAMLDOC)
    file=$(key=$tool yq e 'explode(.) | .[env(key)].file // ""' $YAMLDOC)
    to=$(key=$tool yq e 'explode(.) | .[env(key)].to // ""' $YAMLDOC)
    download_only=$(key=$tool yq e 'explode(.) | .[env(key)].download-only // ""' $YAMLDOC)

    eget $user/$tool \
        ${asset:+--asset $asset} \
        ${file:+--file $file} \
        ${to:+--to $to}\
        ${download_only:+--download-only} \
        -q

    if [[ $download_only ]]; then
        echo '----'
        echo 'running post-download script'
        post_download_install $tool
    fi

done
