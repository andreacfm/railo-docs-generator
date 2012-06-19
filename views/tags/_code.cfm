<cfoutput>
<pre>
<code>
&lt;#rc.tagName#<cfif rc.tagData.attributeType EQ "noname">##<cfloop array="#rc.arrAttrNames#" index="key">#rc.tagData.attributes[key].type# <cfbreak></cfloop>expression## <cfelse><!---
---><cfloop array="#rc.arrAttrNames#" index="key"><cfset attr=rc.tagData.attributes[key]><cfif attr.status EQ "hidden"><cfcontinue></cfif>
    <cfif not attr.required>[</cfif><!---
	---><span class="syntaxAttr">#key#="<cfif not attr.required></cfif>#attr.type#<cfif not attr.required></cfif>"<!---
	---><cfif not attr.required>]</cfif></cfloop></cfif><!---

---><cfif rc.tagData.attributeType EQ "dynamic" or rc.tagData.attributeType EQ "mixed"> ... </cfif><cfif rc.tagData.bodyType EQ "prohibited">&gt;
    <cfelseif rc.tagData.bodyType EQ "free">&gt;

[&lt;/#rc.tagName#&gt;]
    <cfelseif rc.tagData.bodyType EQ "required">&gt;

&lt;/#rc.tagName#&gt;</cfif>
</code>
</pre>
</cfoutput>

