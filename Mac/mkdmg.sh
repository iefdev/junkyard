#!/usr/bin/env bash
#
# ~/ShellScripts/mkdmg.sh
#
# Author: Eric F
# Copy: (c) 2014 Eric F (iEFdev)
#
# Description: A bash script to create a disk image from a folder (incl. encryption and password).
#
# The script is built around the command:
# hdiutil create -srcfolder "/path/to/folder" -format UDBZ -encryption AES-256 -agentpass "/path/to/dest"
#
# Example:
# hdiutil create -srcfolder "~/Desktop/FooBar/" -format UDBZ -encryption AES-256 -agentpass "~/Dropbox/FooBar.dmg"
#
#

# Function: select source directory
function __srcdir()
{
	echo -n "Enter source directory: ";
	read srcdir;
	_srcdir="${srcdir}";

	# Replace "~" with "$HOME"
	if [[ "${_srcdir}" =~ [~] ]]; then
		echo -e "${gy}  :» Replacing \"~\" with \"${HOME}\" ...${cl}";
		_srcdir=$(echo "${HOME}${_srcdir}" | sed 's/~//');
	fi

	if [ -d "${_srcdir}" ]; then
		_folder="${_srcdir}";
	else
		echo -e "${rd}\nError: \"${cy}${_srcdir}${rd}\" does not exist, or isn't a directory${cl}.\nCheck your path &/or spelling.\n";
		__srcdir;
	fi
}

# Function: select destination
function __dmgdest()
{
	echo -n "Enter destination: ";
	read dmgdest;
	_dmgdest="${dmgdest}";

	# If empty...
	if [[ "${_dmgdest}" == '' ]]; then
		_dmgdest="$(dirname ${_folder})/$(basename ${_folder}).dmg";
	fi

	# Replace "~" with "$HOME"
	if [[ "${_dmgdest}" =~ [~] ]]; then
		echo -e "${gy}  :» Replacing \"~\" with \"${HOME}\" ...${cl}";
		_dmgdest=$(echo "${HOME}${_dmgdest}" | sed 's/~//');
	fi

	_basedir_dest=$(dirname "${_dmgdest}");

	if [ -d "${_basedir_dest}" ]; then
		_dest="${_dmgdest}";
	else
		echo -e "${rd}\nError: \"${cy}${_srcdir}${rd}\" does not exist, or isn't a directory${cl}.\nCheck your path and/or spelling.\n";
		__srcdir;
	fi
}

# colors
rd="\033[0;31m";		# rd = röd
gr="\033[0;32m";		# gr = grön
cy="\033[0;36m";		# cy = cyan
gy="\033[1;30m";		# gy = grey
cl="\033[0m";		# cl = clear

cat << INTRO

Create an encrypted “disk image” from folder
--------------------------------------------

# Disk image:
#  :» encryption:    AES-256
#  :» compression:   bzip2

First, select folder...
You can type the path in, or just drag'n'drop the folder into the terminal window.

INTRO
__srcdir;

echo -e "\nSelect... (press 1 or 2).";
select mode in "Create 'disk image'" "Select other destination/name";
do
	if [[ ${REPLY} == "2" ]]; then _mode='go'; fi
	break;
done

if [[ ${_mode} == 'go' ]]; then
	_default_name = "$(basename ${_folder}).dmg";

	cat << DEST

Destination...

  :» Disk name: "$(basename ${_folder}).dmg". If you'd like another name of the disk,
  :» write that in the end (+ .dmg). Example: "Backup.dmg"

You can type the path in, or just drag'n'drop the folder into the terminal window.

DEST
	 __dmgdest

	echo -e "\nFolder: ${_folder}";
	_dest=$(echo "${_dmgdest}" | sed 's/\/*$//g');
	_dest_base=$(basename "${_dest}");
	if [ -d "${_dest}" ]; then
		_dest_disk_image="${_dest}/$(basename ${_folder}).dmg";
	else
		if [[ "${_dmgdest}" =~ [.dmg] ]]; then
			_dest_disk_image="${_dmgdest}";
		else
			_dest_disk_image="${_dmgdest}.dmg";
		fi
	fi

	echo  "Destination: ${_dest_disk_image}";
	echo -e "${gy}  :» Creating disk: $(basename ${_dest_disk_image}) ...${cl}";
	echo -e "${gr}\nPassword:${cl}\n---------";

	# Here we go ...
	hdiutil create -srcfolder "${_folder}" -format UDBZ -encryption AES-256 -agentpass "${_dest_disk_image}";

	# Reveal in Finder
	echo  -e "\n---\nGoing to the disk ...";
	sleep 1;
	open -R "${_dest_disk_image}";

else
	_folder=$(echo "${_folder}" | sed 's/\/*$//g');
	echo -e "\nFolder: ${_folder}";
	echo  "Destination: ${_folder}.dmg";
	echo -e "${gy}  :» Creating disk: $(basename ${_folder}.dmg) ...${cl}";
	echo -e "${gr}\nPassword:${cl}\n---------";

	# Here we go ...
	hdiutil create -srcfolder "${_folder}" -format UDBZ -encryption AES-256 -agentpass "${_folder}.dmg";

	# Reveal in Finder
	echo  -e "\n---\nGoing to the disk ...";
	sleep 2;
	open -R "${_folder}.dmg"
fi

exit ${?};
