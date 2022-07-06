#!/usr/bin/env bash

YAMLDOC="extensions.yml"

# check for yq
if ! command -v yq &>/dev/null; then
	echo "yq could not be found"
	echo "to install w/ eget"
	echo "eget mikefarah/yq"
	exit
fi

readarray sections < <(yq e 'keys | .[]' $YAMLDOC)

get_extensions() {
	for section in "${sections[@]}"; do
		echo $section
		readarray exts < <(key=$section yq e '.[env(key)] | .[]' $YAMLDOC)
		echo ${exts[@]}
		for ext in "${exts[@]}"; do
			write_bat $ext
			write_sh $ext
		done
	done
}

write_bat() {
	echo "call code --install-extension $1 --force" >>install-extensions.bat
}

write_sh() {
	echo "code --install-extension $1 --force" >>install-extensions.sh
}

# clean up old files
rm -f install-extensions.{sh,bat}
echo "echo off" >install-extensions.bat
echo >>install-extensions.bat
echo "echo Installing VSCode extensions" >>install-extensions.bat
echo "#!/usr/bin/env bash" >install-extensions.sh
echo >>install-extensions.sh
echo "echo Installing VSCode extensions" >>install-extensions.sh

# read extensions and write install scripts
get_extensions
