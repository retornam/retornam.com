---
title: "Install Python 3.7 From Source"
date: 2019-07-11T10:31:49-07:00
draft: false
tags: python
---

Below are the the steps to install Python-3.7.4 from source on Debian based
Linux operating systems.

First, install the following base packages.

~~~
sudo apt-get update
sudo apt-get install \
	 build-essential \
	 libffi-dev \
	 libgdbm-dev \
	 libncurses5-dev \
	 libnss3-dev \
	 libreadline-dev \ 
	 libssl-dev \
	 wget \
	 curl
~~~

Next download the latest tarball from Python.org [source download page] with curl

~~~
cd /tmp/
curl -O https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
~~~

Extract the tarball:

~~~
tar -xvf Python-3.7.4.tar.xz
~~~

Change directory to the newly created Python-3.7.4 to run the configure script

~~~
cd /tmp/Python-3.7.4
./configure --enable-optimizations
~~~

After the configure scripts exits successfully, run `make` 


~~~
sudo make -j8
~~~

Next run make install to copy the newly built Python binaries to a location
on your $PATH

```
sudo make install
which python3
python3 --version
```


