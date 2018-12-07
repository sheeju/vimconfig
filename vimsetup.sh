#!/bin/sh

#
# vimsetup.sh
#
# Developed by Sheeju Alex <sheeju@exceleron.com>
# Copyright (c) 2013 Exceleron Inc
# Licensed under terms of GNU General Public License.
# All rights reserved.
#
# Changelog:
# 2013-07-26 - created
#

# init
USERID="$1"

if [ -z "$1" ]; then 
	echo "Please enter valid user"
	exit
fi

/bin/egrep  -i "^${USERID}" /etc/passwd > /dev/null
if [ $? -eq 0 ]; then
	echo "User $USERID exists"
	VIMRC_FILE="/home/$USERID/.vimrc"
	VIM_DIR="/home/$USERID/.vim"

	if [ -f $VIMRC_FILE ];
	then
		echo "File $VIMRC_FILE already exists"
	else
		echo "Linking to $VIMRC_FILE"
		ln -s /home/shared/vimconfig/vimrc /home/$USERID/.vimrc
	fi

	if [ -d $VIM_DIR ];
	then
		echo "Directory $VIM_DIR already exists"
	else
		echo "Linking to $VIM_DIR"
		ln -s /home/shared/vimconfig/vim /home/$USERID/.vim
	fi

else
	echo "User $USERID does not exists: Check Administrator"
fi
