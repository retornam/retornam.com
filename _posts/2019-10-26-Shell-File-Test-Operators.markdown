---
layout: post
title:  "Shell File Test Operators"
date:   2019-10-26 13:12:55 -0700
categories: bash, zsh, shell
---

I've been writing some shell scripts recently and
I've always had to Google which file test operator
to use and when to use them. To prevent constant 
Googling, I'm writing these down here for easier
reference in the future.

* `!`  not
* `-a` `FILENAME` - True if the FILENAME exists, identical to `-e` but deprecated. Use `-e` instead.
* `-b` `FILENAME` - True if the FILENAME exists and is a block device.
* `-c` `FILENAME` - True if the FILENAME exists and is a character device.
* `-d` `FILENAME` - True if the FILENAME exists and is a directory.
* `-e` `FILENAME` - True if the FILENAME exists and is a file (types like socket, directory dont matter here )
* `-f` `FILENAME` - True if the FILENAME exists and is a regular file.
* `-G` `FILENAME` - True if the FILENAME exists and is in the same group as the current user.
* `-h` `FILENAME` - True if the FILENAME exists and is a symbolic link.
* `-g` `FILENAME` - True if the FILENAME exists and has set-group-id(sgid) flag set.
* `-k` `FILENAME` - True if the FILENAME exists and  has a sticky bit flag set.
* `-L` `FILENAME` - True if the FILENAME exists and is a symbolic link.
* `-O` `FILENAME` - True if the FILENAME exists and and is owned by the current user.
* `-N` `FILENAME` - True if the FILENAME has been modified since it was last read.
* `-p` `FILENAME` - True if the FILENAME exists and is pipe.
* `-r` `FILENAME` - True if the FILENAME exists and is readable by the current user.
* `-S` `FILENAME` - True if the FILENAME exists and is a socket file.
* `-s` `FILENAME` - True if the FILENAME exists and has a nonzero size.
* `-t` `FILENAME` - True if the FILENAME exists and a file descripter associated with a terminal device.
* `-u` `FILENAME` - True if the FILENAME exists and the set-user-id (suid) flag is set.
* `-w` `FILENAME` - True if the FILENAME exists and is writeable.
* `-x` `FILENAME` - True if the FILENAME exists and is an executable.

