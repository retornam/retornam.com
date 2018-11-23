---
layout: post
title:  "Brew Cleanup"
date:   2018-11-23 13:25:06 -0700
categories: homebrew
---

If you're looking to recover some harddrive space on OS X
after installing too many homebrew packages, the following 
comand will help.  

{% highlight bash %}
	brew cleanup --dry-run -s 
{% endhighlight %}

The above command will tell you the location of files it is
about to remove and an approximation of the about of disk
space you'll save after the files are removed.

If you're satifisfied with the output of the dryrun, use  

{% highlight bash %}
	brew cleanup -s
{% endhighlight %}

to force the removal of  all the files.








[tmcw]: https://macwright.org










