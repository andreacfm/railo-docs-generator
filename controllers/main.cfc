<cfcomponent output="false" hint="Example FW/1 controller.">
	
	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw" />
		<cfset variables.fw = arguments.fw />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="default" output="false" hint="Default action.">
		<cfargument name="rc" />
        <cfscript>
            git = application.beanFactory.getBean("Git");
            dump(git.getRepo());
            abort;
        </cfscript>
		<cfset rc.when = now() />	<!--- set when for service argument --->
		<!--- queue up a specific service (formatter.longdate) with named result (today)  --->
		<cfset variables.fw.service( 'formatter.longdate', 'today' ) />
	</cffunction>
	
</cfcomponent>