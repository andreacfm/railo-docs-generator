<cfinclude template="_description.cfm"/>
<cfinclude template="_intro.cfm"/>
<cfinclude template="_code.cfm"/>
<cfinclude template="_attributes.cfm"/>
<cfinclude template="_examples.cfm"/>

<!---
<cfif structKeyExists(data,"script") and data.script.type NEQ "none">
    <cfset arrAttrNames=StructKeyArray(data.attributes)>
    <cfset ArraySort(arrAttrNames,'textnocase')>
        <br />#stText.doc.alsoScript#
    <pre><span class="syntaxTag">&lt;cfscript></span>
        <span class="syntaxAttr">#data.name#</span>



No Name
<cfif data.attributeType EQ "noname"> <span class="syntaxAttr">##<cfloop array="#arrAttrNames#" index="key">#data.attributes[key].type# <cfbreak></cfloop>expression##</span>

Single type
 <cfelseif data.script.type EQ "single"><span class="syntaxAttr"><cfloop array="#arrAttrNames#" index="key"><cfset ss=data.attributes[key].scriptSupport><cfif ss NEQ "none"> 
 <cfif ss EQ "optional">[</cfif>#data.attributes[key].type#<cfif data.script.rtexpr> expression</cfif><cfif ss EQ "optional">]</cfif><cfbreak></cfif></cfloop></span>


multiple
<cfelse><cfloop array="#arrAttrNames#" index="key"><cfset attr=data.attributes[key]><cfif attr.status EQ "hidden"><cfcontinue></cfif>
    <cfif not attr.required><span class="syntaxAttr">[</span></cfif>
	<span class="syntaxAttr">#key#</span>=<span class="syntaxText">"<cfif not attr.required><i></cfif>#attr.type#<cfif not attr.required></i></cfif>"</span>
	<cfif not attr.required><span class="syntaxAttr">]</span></cfif></cfloop></cfif>

<cfif data.attributeType EQ "dynamic" or data.attributeType EQ "mixed"> <span class="syntaxAttr">...</span> </cfif><cfif data.bodyType EQ "prohibited"><span class="syntaxAttr">;</span><cfelseif data.bodyType EQ "required" or data.bodyType EQ "free"><span class="syntaxAttr"> {

}</span></cfif>
        <span class="syntaxTag">&lt;/cfscript></span></pre>
</cfif>


 Body
    <h2>#stText.doc.bodyTitle#</h2>
    #stText.doc.body[data.bodyType]#
--->
