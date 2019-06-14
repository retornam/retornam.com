---
layout: post
title: "Brew Bundle"
date: 2019-06-14 02:01:10 -0700
categories: homebrew
---


I recently discovered the [brew bundle] tap. This
tap saves all your installed [homebrew] packages to
a file. This makes it easy to version control your 
installed packages or make a list easy list of packages
to share with others.


Install the Homebrew bundle tap, to activate the `brew bundle` command

{% highlight bash %}
	brew tap Homebrew/bundle
{% endhighlight %}

To dump all your installed packages to a `Brewfile`  run 


{% highlight bash %}
	brew bundle dump
{% endhighlight %}


The dump command creates a `Brewfile` in the current working directory with
all packages installed by Homebrew as entries.



[brew bundle]: https://github.com/Homebrew/homebrew-bundle
[homebrew]: https://brew.sh


















