---
title: "View Routing Table on OS X and Linux"
date: 2019-11-29T19:18:39-08:00
draft: false
---

On Linux, the **route** command shows and manipulates the IP routing
table. To view the full route table, use the command **route -n**.The **-n** flag 
according to the man pages:

~~~
show numerical addresses instead of trying to determine symbolic
host names. This is useful if you are trying to determine why the
route to your nameserver has vanished.
~~~

In much simpler language, the **-n** flag resolves IP addresses to their hostnames.

For example the destination **default** displays **0.0.0.0** if you pass the
**-n** flag and **default** without it.


OS X on the other hand has the **route** command but can only manually manipulate
the routing tables and doesn't show the table like on Linux.For this reason,
I often use the **netstat** command instead and prefer **netstat -nr**


The **-n** flag on OS X according to the man page:
~~~
shows network addresses as numbers (normally netstat interprets addresses and
attempts to display them symbolically).  
This option may be used with any of the display formats
~~~

The **r** flag according to the man page:

~~~
show the routing tables.  Use with -a to show protocol-cloned routes.  
When -s is also present, show routing statistics instead.  
When -l is also present, netstat assumes more columns are there and the
maximum transmission unit.  More detailed information about the route metrics 
are displayed with -ll for TCP round trip times -lll for all metrics.  
Use the -z flags to display only entries with non-zero RTT values.  (''mtu'') 
are also displayed.
~~~

As always, it is good to spend time reading the man pages to understand the flags
available for each command and how to use them properly.


Hope this helps
