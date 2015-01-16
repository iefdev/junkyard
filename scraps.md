scraps
======

_“scraps” - short for screencaptures_


A small Terminal GUI to get/set your prefs for `com.apple.screencapture`.

> _This script was originally made as a helper to a user that needed a little help with the (scary) Terminal._


Install
-------

Put the file in /usr/local/xbin (or any folder in /usr/local you prefer. Make sure it’s in `PATH`), and give it permission to execute.

	sudo cp scraps /usr/local/xbin
	sudo chmod +x /usr/local/xbin/scraps



Usage & examples
----------------

If you only run `scraps`, all settings will run 1-by-1. If you want to skip a section, just press enter to get to the next one.

**All**

	scraps


**Read**

To read the preferences:

	scraps -read

_(eg same thing as: `defaults read com.apple.screencapture`)_

 


**Change/set one option**

	scraps -folder

The script runs the settings for folder _(location)_.

The different options are:

	scraps -folder
	scraps -name
	scraps -type
	scraps -shadow

**Quickmode**

Same thing like above (1-by-1), but without the interactivity. The options are set immediately. More like aliases to run the different `defaults write`.

The different options are:

	scraps -f "/path/to/folder/"
	scraps -n "Prefix-name"
	scraps -t png|jpg|gif etc...
	scraps -s on|off


Example:

	scraps -t png

	# same thing as
	defaults write com.apple.screencapture type -string png
	killall SystemUIServer

Which makes it relatively easy to switch between image types, if you like to change, like: `png` -> `jpg`, and back again.



Help & info
-----------

Showing the “help”:

	scraps -h
	scraps --help

...with ` | less`:

	scraps -hl
	scraps --helpless

Showing info (version & quickhelp):

	scraps -info
