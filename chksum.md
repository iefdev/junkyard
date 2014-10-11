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



### Example

Succes:

	[me@myhost] ~$ chksum sha da39a3ee5e6b4b0d3255bfef95601890afd80709 test.txt
	test.txt:		... OK
	[me@myhost] ~$

Error:

	[me@myhost] ~$ chksum sha da39a3ee5e6b4b0d3255bfef95601890afd80708 test.txt
	test.txt:		... FAILED

	chksum: WARNING: The checksum (da39a3ee5e6b4b0d3255bfef95601890afd80708) did NOT match

	[me@myhost] ~$