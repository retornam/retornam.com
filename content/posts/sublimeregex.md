---
title: "Sublime Text Regex Tips"
date: 2019-07-19T18:49:03-07:00
draft: false
---


I sometimes have to replace the nth character of a large text file 
with another character, an example being a badly formatted csv file. 
For example, if I want to replace the 7th character of each line in 
a file with a **comma**, using Sublime Text

~~~
Find:	^(.{7})(.)
Replace: \1,

Remember to enable /Re in the Sublime Find Replace dialog.
~~~

The same task can be performed with sed

~~~
sed 's/./,/7' filename > newfilename
~~~
