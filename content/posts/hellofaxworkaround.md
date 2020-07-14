---
title: "Hellofax Print Workaround"
date: 2019-07-17T10:32:44-07:00
draft: false
---

I received a link to an official document that required my signature
via email last week. Unlike most people, I print out and read every
legsal document by line, highlighting the parts I do not understand and only 
sign them after I've understood everything in the  document.

The document was hosted on a web-service called Hellofax. Hellofax doesn't
provide a way to print out or export the document before signing, this workflow
doesn't work for people like me who carefully examine every legal document.

Thankfully, we have access to the browsers developer tools, so we can use a
specific css selector. Using the selector below, I was able to select all
the pages in the document.

```
$('img[src*="hellofax_uploads/"]')

``` 

I then used the following script to copy all the links to my clipboard

```
items=$('img[src*="hellofax_uploads/"]')
links = []
for(x=0; x<items.length; x++) { console.info(links.push(items[x].src));}
copy(links)
```

I saved the clipboard item to a folder named `contract`, then used the following shell script to download all the images

```
#download every image.
while read word; do URL=$word; wget $URL; done < contract

# shorten names
ls conv* | awk '{ {printf "%s ",$1;} sub(/\?.*/, ""); { printf " %s \n",$1; } }' > tobemoved

# rename files
cat tobemoved | cut -d' ' -f3 | xargs -Ivar zsh -c "mv var* var"
```

These images can then be printed out and examined before signing.





