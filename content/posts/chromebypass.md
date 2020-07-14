---
title: "Bypass Chrome HTTPS Certificate Errors"
date: 2019-07-10T10:31:59-07:00
draft: false
---

Chrome often throws certificate errors for local development sites
with self-signed HTTPS certificates. As of this writing, the way
to get around this is to type **thisisunsafe** when the error appears. 
The Chrome team sometimes updates this bypass, when that happens,
visit the Chrome [codebase] looking for the base64 encoded **BYPASS_SEQUENCE**.


Decode it using the following command, replacing BYPASS_SEQUENCE with the text
you copied from the code.

~~~
echo BYPASS_SEQUENCE | base64 --decode
~~~






[codebase]: https://chromium.googlesource.com/chromium/src/+/master/components/security_interstitials/core/browser/resources/interstitial_large.js#19

