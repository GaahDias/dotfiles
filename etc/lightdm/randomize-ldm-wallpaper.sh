#!/bin/bash

# You may want to change the permissions for your ldm files:
# chmod +rwx /etc/lightdm/*
# chown username /etc/lightdm/*

w_path=$1
ldm_path="/etc/lightdm"

if [[ "$w_path" != "" ]]; then
	# Threating w_path var
	# (adding / at the end, and passing
	# $HOME instead of ~
	if [[ "$w_path" == "~"* ]]; then
		w_path="${w_path/\~/$HOME}"
	fi
	if [[ "${w_path: -1}" != "/" ]]; then
		w_path=$w_path$"/"
	fi

	if [ -d "$w_path" ]; then
		 # Getting random wallpaper path and name
		 rw_name="$(ls $w_path | shuf | head -1)"
		 rw_path="${w_path}${rw_name}"
		 echo "Wallpaper: ${rw_path}"

		 # Removing existing wallpapers in ldm folder
		 rm -rf $ldm_path/wallpapers/*
		 # Copying random wallpaper into ldm folder
	     cp "${rw_path}" "${ldm_path}/wallpapers"
		 # Deleting last line of slick-greeter.conf
		 sed -i '$d' "${ldm_path}/slick-greeter.conf"
		 # Setting background to new wallpaper on slick-greeter.conf
		 echo "background=${ldm_path}/wallpapers/${rw_name}" >> "${ldm_path}/slick-greeter.conf"
	else
		echo "Path doesn't exist"
		exit 1
	fi
else
	echo "Path not provided"
	exit 1
fi
