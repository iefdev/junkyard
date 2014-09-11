n2rgb
-----

This is just a small script to grab preformatted rgb(a) values from a file. It'll return rgb(a) values to just copy and paste. The script is using `awk` to filter the values, so searching for “red” will match all names with “red” in it. _(see Example 1-2)_

In X11 there's a great file with a list of color names and their values. In my OS X, the file location for that file is:

```
/usr/X11/share/X11/rgb.txt
```

X11 is not installed on default on OS X so along with the script, there's a copy of that file _(see `n2rgb_rgb.txt`)_.

_Only tested in OS X. Please report if it works elsewhere._



### Install

Put the script in `/usr/local/bin`, or any folder of your choice. Just make sure it's in `$PATH`.

	sudo cp n2rgb /usr/local/bin
	chmod +x /usr/local/bin/n2rgb



### Usage

	n2rgb [-a] color names

 

**Example 1:**

	n2rgb red wheat

Will produce a list of:

```
# RGB				/* Name(s) */
# -------------------------------------------------- #

# red:
  rgb(205,92,92)  		/* indianred */
  rgb(255,69,0)  		/* orangered */
  rgb(255,0,0)  		/* red */
  rgb(219,112,147) 		/* palevioletred */
  rgb(199,21,133)  		/* mediumvioletred */
  rgb(208,32,144)  		/* violetred */
  rgb(255,0,0)  		/* red1 */
  rgb(238,0,0)  		/* red2 */
  rgb(205,0,0)  		/* red3 */
  rgb(139,0,0)  		/* red4 */
  rgb(139,0,0)  		/* darkred */

# wheat:
  rgb(245,222,179)  		/* wheat */
  rgb(255,231,186)  		/* wheat1 */
  rgb(238,216,174)  		/* wheat2 */
  rgb(205,186,150)  		/* wheat3 */
  rgb(139,126,102)  		/* wheat4 */

# -------------------------------------------------- #
```

The `-a` handler output the values in a `rgba()` style.

 

**Example 2:**

	n2rgb -a red wheat

Will produce a list of:

```
# RGBA				/* Name(s) */
# -------------------------------------------------- #

# red:
  rgba(205,92,92,1)		/* indianred */
  rgba(255,69,0,1) 		/* orangered */
  rgba(255,0,0,1)  		/* red */
  rgba(219,112,147,1)	/* palevioletred */
  rgba(199,21,133,1)	/* mediumvioletred */
  rgba(208,32,144,1)	/* violetred */
  rgba(255,0,0,1)  		/* red1 */
  rgba(238,0,0,1)  		/* red2 */
  rgba(205,0,0,1)  		/* red3 */
  rgba(139,0,0,1)  		/* red4 */
  rgba(139,0,0,1)  		/* darkred */

# wheat:
  rgba(245,222,179,1)  		/* wheat */
  rgba(255,231,186,1)  		/* wheat1 */
  rgba(238,216,174,1)  		/* wheat2 */
  rgba(205,186,150,1)  		/* wheat3 */
  rgba(139,126,102,1)  		/* wheat4 */

# -------------------------------------------------- #
```



### X11

If you don't have X11 installed, and/or if my path doesn't match your system. Please edit the file (~ line: [15-16][path]), and comment/uncomment the lines to match your choice or path.


[path]: https://github.com/iEFdev/junkyard/blob/master/n2rgb#L15-16