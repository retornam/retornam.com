---
layout: post
title:  "Git ls-files"
date:   2019-08-03 13:54:09 -0700
categories: git, tips
---


If you ever make the mistake of directly removing  a long list of files and
folders in a git repository with `rm` instead of `git rm`, you can save yourself
from having to individually removing each file/folder referenced in git using 
the command

~~~
git ls-files --deleted | xargs git rm
~~~ 

According to the man page, the flag ls-files --deleted outputs all recently 
deleted files.

I wrote this down to serve as a reminder to myself.