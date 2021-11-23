<!---script--->
<cfscript>
	myquery = QueryExecute('SELECT * FROM artists', [], {datasource = 'cfartgallery'});
</cfscript>

<!---tags--->
<cftry>
	<cfquery name="myQuery" datasource="cfartgaller2y">
		SELECT * FROM artists
	</cfquery>
	
	<cfcatch type="any">
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

<cfquery name="myQuery" datasource="cfartgallery">
	SELECT * FROM artists
</cfquery>

<cfoutput query="myQuery">
	#myquery.CurrentRow# - #myquery.email# - #myquery.firstname# - #myquery.lastname#<br>
</cfoutput>

<cfdump var="#myQuery#">


<cfset myquery2 = QueryExecute(' SELECT * FROM art ORDER BY issold', [], {datasource = 'cfartgallery'})>
<cfdump var="#myQuery2#">
<cfoutput Query="myQuery2" group="issold">
    <p>
        Sold ?: #YesNoFormat(myQuery2.issold)#:<br>
        <blockquote>
            <cfoutput>
                #myQuery2.artname#: #DollarFormat(myQuery2.price)#<br>
            </cfoutput>
        </blockquote>
    </p>
    <hr>
</cfoutput>