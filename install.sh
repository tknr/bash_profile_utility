#!/bin/bash
cd `dirname $0`
script_file=`pwd`/bash_profile_utility.bash
installed_count=`grep ${script_file} ~/.bash_profile | wc -l`
if [ $(( ${installed_count} )) -ne 0 ] ;then
	echo 'already installed.'
	exit 0
fi
echo "source ${script_file}" >> ~/.bash_profile
echo 'installed.'
echo 'for completing installation, you should execute'
echo ' source ~/.bash_profile'
exit 0
