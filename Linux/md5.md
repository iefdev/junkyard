MD5
===
>_bash script/wrapper for md5sum_


This is just a _dirty hack_ to get "md5" onboard my Linux machine(s). Linux only have "md5sum", and I needed this script to use with "chksum".

It doesn't bring all options, but the 3 options are:

|          |                                                          |
| :------- | :------------------------------------------------------- |
| `md5 -s` | Get `md5` from a "text string"                           |
| `md5 -q` | _Quiet_, only returning the checksum                     |
| `md5 -r` | Reversed ...displaying the same thing as `md5sum --text` |
| `md5`    | same as `md5sum --tag` (BSD-style)                       |

 

- - -

OS X man page: [md5(1)][osxman]


<!-- Markdown: img and link defs -->
[osxman]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/md5.1.html