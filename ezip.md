ezip{,1}
========

Even if there are great programs that kan pack files and folder - being on OS X we have to deal with the resource files. And sending a zip file with a script for example, with full of those are not so appreciated. There are a few “zip cleaners” to use, but it's better to zip without them from start. _(And why get an xtra app, when you can script it. ^^)_

**`ezip1`** is the firts script I used, realizing quickly I needed something else when it only handled 1 folder, so **`ezip`** is the working one.

One folder/file will zip into: _foldername.zip_ while multiple files/folders will be zipped into an _Archive.zip_. To avoid overwriting, the nameing will be _Archive1.zip_ etc, and it'll find the lowest available number if there's a gap in the serie. Just to get a simular behaviour to “Archive Utility”.

_It's nothing fancy or anything... Just a working script that suited my needs._

### Install

Put the script(s) in `/usr/local/sbin`, and give it execute permissions (`chmod +x`).

### Usage

	ezip1 folder

	ezip file1 file2 file3 file4
	ezip folder1 [, folder2 file3 etc]
