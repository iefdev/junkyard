chksum
------

A small script to check md5/sha* checksum when downloading something, where they offer a checksum to verify against.



### Install

Put the script in `/usr/local/xbin`, or any folder of your choice. Just make sure it's in `$PATH`.

Give it execute permissions (`chmod +x`).



### Usage

	chksum md5 [-s] <checksum> file
	chksum sha [-s] <checksum> file
	chksum sha256 [-s] <checksum> file	# or any other "sha*"
	chksum [-h|-hl]

