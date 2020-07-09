---
layout: post
title:  "Reversing Pinned Android Certificates"
class: post
date:   2020-07-07 17:49:13 -0700
categories:
---


A couple of days ago, I wanted to see all the requests a new app I had installed
was making. After firing up mitmproxy to proxy requests coming in from my android
device, I quickly realized that the application in question had implemented SSL
certificate pinning.

Many applications implement certificate pinning as an extra security layer
to protect their users from man-in-the-middle attacks. Certificate pinning allows
app developers to specify a list of certificates and ertificate authorities as valid
thus bypassing Android's default certificate store for validation. It also has 
the added advantage of preventing snoopers from seeing requests made to certain
private APIs without decrypting/ reverse engineering the application.

There are many online tutorials out there on how to reverse engineer android 
applications to remove the pinned certificate, many of them however go deeper
into steps to remove certificate pinning instead of following the simple steps
below. 


Install the following tools, if you dont have them already.

- [apktool](https://github.com/iBotPeaches/Apktool/tags)
- [adb](https://developer.android.com/studio/command-line/adb)
- [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer/tags)


Copy the apk from your phone to a directory on your computer with adb

`adb pull /data/app/com.example.example/example.apk example.apk`

Decode the apk to the current directory using apktool

`apktool d example.apk`

Edit the application element in AndroidManifest.xml to include
android:networkSecurityConfig="@xml/network_security_config

Create or edit the file with path res/xml/network_security_config.xml to look
as follows

```
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config>
        <trust-anchors>
            <certificates src="system" />
            <certificates src="user" />
        </trust-anchors>
    </base-config>
</network-security-config>
```

Rebuild the apk to include the changes you made

```
apktool b app -o example-patched.jar
```

Sign the newly patched apk with the uber-apk-signer, you will not be able
to install the new apk on your device without signing it.

```
java -jar uber-apk-signer-1.1.0.jar --apks example-patched.apk
```

Install the signed apk on your device

```
adb install example-signed.apk
```

Configure your device to use your mitmproxy of choice and proxy away.




