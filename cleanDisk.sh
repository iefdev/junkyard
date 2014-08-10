#!/bin/bash
#
# ~/ShellScripts/cleanDisk.sh
#
# Small shell script to clean external disks from OS X-junk
# like: .DS_Store ._ etc.
#
# Usage:
# ~/ShellScripts/cleanDisk.sh MyUSBDisk
# ~/ShellScripts/cleanDisk.sh My\ USBdisk		(name with blank step)
# ~/ShellScripts/cleanDisk.sh "My USBdisk"		(name with blank step)

# Only the name of the disk. In that way we never get to /
if [ -d /Volumes/"$1" ]; then
	cd /Volumes/"$1";
else
	echo "There's no disk with the name: $1";
	echo 'Aborting...';
	exit;
fi

# .DS_Store
echo -e '\nDeleting all .DS_Store (recursively): ';
find ./ -name ".DS_Store" -delete;
#find ./ "-name" ".DS_Store" -exec rm {} \;		# generic unix way	

# ._* (eg. ._file1, ._file2 etc)
echo 'Deleting all ._\* (rekursivt): ';
find ./ -name "._*" -delete;
#find ./ "-name" "._*" -exec rm {} \;			# generic unix way

# Removing xtra folders and OS X stuff, if they exist.
echo -e '\nSearching -> deleting the folders: .Trashes, .Spotlight-V100 och .fseventsd\n';
for i in {{ .fseventsd .Spotlight-V100 .Trashes }}; do
	if [ -d $i ]; then
		echo -n 'Deleting folder: ';
		rm -rfv $i;
	fi
done

echo -e '\nDone!\n';
exit;
