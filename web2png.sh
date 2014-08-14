#!/bin/bash
# ------------------------------------------------------------------
# Shell script for Webkit2png (http://www.paulhammond.org/webkit2png/)
#
# © 2012, Eric F
#
# Options:
# ----------
# Edit the options to your needs. To find all options,
# see: webkit2png --help
#
# "My defaults": With "-W 960", the thumbs get 250px wide
# with "-s 0.26"
#
INPUT="$1";
WEB2PNG=/usr/local/sbin/webkit2png;
FOLDER=~/Desktop/"$INPUT";
WWW=http://"$INPUT"/;

# Options
SIZE="-W 960 -H 700";			# (default: 800x600)
THUMBSIZE="-s 0.26"; 			# (default: 0.25)
NOCLIP="-TF";
PREFIX="-o $INPUT";
LOCATION="-D $FOLDER";

# All together now...
OPTIONS="$SIZE $THUMBSIZE $NOCLIP $PREFIX $LOCATION";

# Check if the folder exists or not?
if ! [ -d $FOLDER ]; then
	mkdir -pv $FOLDER;
fi

# Ok, let's do it...
if python $WEB2PNG $OPTIONS $WWW; then
		# Reveal in Finder
		open -R $FOLDER;
fi

