---
title: "Building Python on MacOS Big Sur"
date: 2020-11-18T09:06:03-08:00
draft: false
---

Early last week, I broke my five-year rule of not upgrading to a newly released version of macOS until after two minor dot releases for the first time. As with every new operating system upgrade, this new update broke many of the packages I use daily. A major one being pyenv, a tool I use for building and managing various versions of the Python programming language. After upgrading, I tried building Python 3.8.6 with pyenv only to receive the following error messages.

~~~
➜ pyenv install 3.8.6
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.8.6.tar.xz...
-> https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tar.xz
Installing Python-3.8.6...
python-build: use readline from homebrew

import pip._internal
  File "<frozen zipimport>", line 241, in load_module
  File "<frozen zipimport>", line 709, in _get_module_code
  File "<frozen zipimport>", line 570, in _get_data
BUILD FAILED (OS X 11.0.1 using python-build 20180424)
zipimport.ZipImportError: can't decompress data; zlib not available
~~~

Even though I had updated to the latest versions of both XCode and XCode command-line tools, pyenv's python-build process was unable to locate the header files for zlib.

Next, I tried exporting the path to the header files using the CFLAGS and LDFLAGS environment variables

~~~
➜ CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" LDFLAGS=" -L$(xcrun --show-sdk-path)/usr/lib" pyenv install 3.8.6
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.8.6.tar.xz...
-> https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tar.xz
Installing Python-3.8.6...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk


import pip._internal
  File "<frozen zipimport>", line 241, in load_module
  File "<frozen zipimport>", line 709, in _get_module_code
  File "<frozen zipimport>", line 570, in _get_data
BUILD FAILED (OS X 11.0.1 using python-build 20180424)
zipimport.ZipImportError: can't decompress data; zlib not available
~~~

Even with the added exports, the build was unable to locate zlib files. I decided to skip using the zlib files provided
by XCode next, by installing zlib using Homebew and then exporting the new
path to LDFLAGS, CFLAGS, and CPPFLAGS before issuing the build command.

If this is your first time using [Homebrew], follow the prompts to install openssl, sqlite, readline, bzip2, and zlib as kegs. Do not link the packages to your /usr/local or /usr/local/opt directories as this could cause potential
issues in the future.

~~~
➜ brew install openssl sqlite readline bzip2 zlib
~~~

After the above command exits successfully, execute the following command to build Python with pyenv. 



~~~
➜ CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" CPPFLAGS="-I/usr/local/opt/bzip2/include" pyenv install 3.8.6
~~~

[pyenv]: https://github.com/pyenv/pyenv
[Homebrew]: https://brew.sh
