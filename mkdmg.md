mkdmg.sh
========

`mkdmg.sh` is a small shell script that creates a password protected/encrypted `.dmg` file from an existing folder (in OS X). It doesn't create an _spare image_... The size is based on the content.. Great for small backups etc.

Compression is BZ (bzip2) and encryption is AES-256. It's the same this as doing it in DiskUtility(.app), just easier this way. ^^


### Install

Put the script in `~/ShellScripts`, and give it execute permissions (chmod +x).

	chmod +x ~/ShellScripts/mkdmg.sh


### Usage

	~/ShellScripts/mkdmg.sh


Or create an alias...

	alias mkdmg='~/ShellScripts/mkdmg.sh'


Here's a sample output running “mode 2".

 * _Mode 1 creates a `.dmg` with same the name as the source._
 * _Mode 2 (the example) you can edit your destination._


	[my@terminal] ~$ ~/ShellScripts/mkdmg.sh

	Create an encrypted “disk image” from folder
	--------------------------------------------

	# Disk image:
	#  :» encryption:    AES-256
	#  :» compression:   bzip2

	First, select folder...
	You can type the path in, or just drag'n'drop it into the terminal window.

	Ange folder: /Users/FooBar/ShellScripts/testfolder

	Select... (press 1 or 2).
	1) Create 'disk image'
	2) Select other destination/name
	#? 2


```
Destination...

  :» Disk name: "`basename $_folder`.dmg". If you'd like another name of the disk,
  :» write that in the end (+ .dmg). Exampel: "Backup.dmg"

You can type the path in, or just drag'n'drop it into the terminal window.

Enter destination: fooBar.dmg

Folder: /Users/FooBar/ShellScripts/testfolder
Destination: fooBar.dmg
  :» Creating disk: fooBar.dmg ...

Password:
---------
Enter a new password to secure "fooBar.dmg":
Re-enter new password:
..
created: /Users/FooBar/ShellScripts/fooBar.dmg

---
Going to the disk ...

```

_... = reveals the disk in Finder._
