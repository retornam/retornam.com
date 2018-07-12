---
layout: default
permalink: /archive/
class: blog
---

{% include bars %}
<div class="container">
	{% include info %}
	<div class="posts">
	    <div class="title">
	    	<h1>Archive</h1>
	    	<hr>
	    </div>
	</div>

</div>
<div class="pad2y limitert">
	<table class="data-table" style="width:100%">
		<tbody>
			{% for post in site.posts %}
			<tr>
				<td class="rcode rdate">{{ post.date | date: "%Y %m %e -" }}</td>
				<td><a href="{{ post.url }}">{{ post.title }}</a></td>
			</tr>
			{% endfor %}
	  </tbody>
	 </table>
</div>

