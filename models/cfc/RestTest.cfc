<cfcomponent rest="true" restpath="restService">
	
	<cffunction name="sayHello" access="remote" returntype="String" httpmethod="GET">
		<cfset rest = "Hello World">
		<cfreturn rest>
	</cffunction>
	
</cfcomponent>