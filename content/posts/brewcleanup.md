---
title: "Brew Cleanup"
date: 2018-11-23T13:25:06-07:00
draft: false
---

For users looking to recover some much needed disk space on
MacOS after years of installing and upgrading brew packages,
I have some good news for you. Homebrew comes with a command to 
periodically cleanup unused resources.

```
brew cleanup --dry-run -s
```

The cleanup dry-run command shows you the location of files/folders
that homebrew think sis safe to remove. It also returns an approximation
of the total disk space that will be freed after the files are removed.

After a thorough review of the output of dry-run,
use the following to permanently remove all the files

```
brew cleanup -s
```
