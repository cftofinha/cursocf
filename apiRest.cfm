<cfhttp url="http://localhost:8500/rest/RestTest/restService"
		method="get"
		port="8500"
		result="res">
</cfhttp>

<cfdump var="#res#">