<cfoutput>
    <h2>Attribute</h2>

    <cfif rc.tagData.attributeType EQ "fixed" and not arrayLen(rc.arrAttrNames)>
        This tag has no attributes
    <cfelse>
        #rc.tagData.attributeType#
<!---
        <cfif rc.tagData.attributeType EQ "dynamic">
            <cfif rc.tagData.attrMin GT 0 and rc.tagData.attrMax GT 0>
                #replace(replace(stText.doc.attr.minMax,"{min}",rc.tagData.attrMin),"{max}",rc.tagData.attrMax)#
                <cfelseif rc.tagData.attrMin GT 0>
                #replace(stText.doc.attr.min,"{min}",rc.tagData.attrMin)#
                <cfelseif rc.tagData.attrMax GT 0>
                #replace(stText.doc.attr.max,"{max}",rc.tagData.attrMax)#
            </cfif>

        </cfif>
--->

    </cfif>
    <cfif (rc.tagData.attributeType EQ "fixed" or rc.tagData.attributeType EQ "mixed") and arrayLen(rc.arrAttrNames)>
        <table class="table table-striped table-condensed">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Description</th>
                </tr>
            </thead>
            <cfloop array="#rc.arrAttrNames#" index="key">
                <cfset attr = rc.tagData.attributes[key]>
                <cfif attr.status EQ "hidden"><cfcontinue></cfif>
                <tr>
                    <td>#key#</td>
                    <td><cfif attr.type EQ "object">any<cfelse>#attr.type#</cfif></td>
                    <td>#YesNoFormat(attr.required)#</td>
                    <td><cfif attr.status EQ "deprecated"><b class="error">#stText.doc.depAttr#</b><cfelse>#attr.description#</cfif>&nbsp;</td>
                </tr>
            </cfloop>

        </table>

    </cfif>


</cfoutput>