
<cfset getdata = QueryExecute('SELECT ARTISTID, artid,  ARTNAME, DESCRIPTION, ISSOLD, PRICE, LARGEIMAGE FROM art where artistid  = ?', [1], {datasource = 'cfartgallery'}) />
<!---<cfdump var="#getdata#">
<cfabort>--->
<cfxml variable="artxml">
	<art artistid="<cfoutput>#getdata.artistid#</cfoutput>">
		<cfoutput query="getData">
			<piece id="#getData.artid#" available="#getdata.isSOLD#">
				<artname>#getData.artname#</artname>
				<description>#getData.artNAME#</description>
				<image>#getData.LARGEIMAGE#</image>
				<price>#getData.PRICE#</price>
			</piece>
		</cfoutput>
	</art>
</cfxml>

<!---<cfdump var="#artxml#">--->
<cfset filewrite("#expandpath('./out.xml')#", artxml)>

<cfloop array="#artxml.art.xmlchildren#" index="i" >
	<cfoutput>
		name: #i.artname.xmlText#<br/>
		price: #i.price.xmlText#<br/>
		Available? #yesNoFormat(i.xmlAttributes["available"])#
	</cfoutput>
	<br>
</cfloop>