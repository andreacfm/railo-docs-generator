<cfoutput>
    <cfloop array="#rc.tags#" index="tag">
       <a class="btn" href="#buildUrl(action = "tags.view", queryString = "cf#tag#")#">cf#tag#</a>
    </cfloop>
</cfoutput>
