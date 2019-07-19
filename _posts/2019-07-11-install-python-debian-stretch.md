---
layout: post
title:  "Install Python 3.7 from source"
date:   2019-07-11 15:27:57 -0700
categories: debian,python
---

Below are steps to install Python-3.7.4 from source on Debian.

First install the following packages, these packages are required to
build Python from source.

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

Download the latest tarball from  the Python [source download page] using curl

```
cd /tmp
curl -O https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
```

Now, extract the tarball:

```
tar -xf Python-3.7.4.tar.xz
```

Change into the expanded source directory and run the configure script

```
cd /tmp/Python-3.7.4
./configure --enable-optimizations
```

After this is done, run `make` to start building the binary.

```
make -j8
```

Modify the  `-j` flag according to the number of processor cores on your computer.

After successfully building the binaries, run make install to make the newly 
built Python the default 

```
sudo make install
```

Make sure everything works by running 

```
which python3
python3 --version

```







[source download page]:https://www.python.org/downloads/source/