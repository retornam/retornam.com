---
title: "Brew Bundle"
date: 2019-06-14T02:01:10-07:00
draft: false
---

I recently discovered the [brew bundle] tap. This
tap saves all your installed [homebrew] packages to
a file. This makes it easy to version control your 
installed packages or make a list easy list of packages
to share with others.


Install the Homebrew bundle tap, to activate the `brew bundle` command

~~~
	brew tap Homebrew/bundle
~~~

To dump all your installed packages to a `Brewfile`  run 


~~~
	brew bundle dump
~~~

The dump command creates a `Brewfile` in the current working directory with
all packages installed by Homebrew as entries.



[brew bundle]: https://github.com/Homebrew/homebrew-bundle
[homebrew]: https://brew.sh

