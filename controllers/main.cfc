<cfcomponent output="false" hint="Example FW/1 controller.">
	
	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw" />
		<cfset variables.fw = arguments.fw />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="default" output="false" hint="Default action.">
		<cfargument name="rc" />
	</cffunction>
	
</cfcomponent>