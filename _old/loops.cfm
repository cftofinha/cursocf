<cfoutput>
	<cfloop from="1" to="5" index="i">
		#i#<br>
	</cfloop>

	<br><hr><br>
	<h3>Loop de Array</h3>
	<cfset myArray = ['Jeff', 'John', 'Steve', 'Julianne']>
	<cfloop from="1" to="#arrayLen( myArray )#" index="i">
		#i#: #myArray[i]#<br>
	</cfloop>
	
	<br><hr><br>
	<h3>Loop de Lista</h3>
	<cfset myList = 'Jeff,John,Steve,Julliane'>
	<cfloop list="#myList#" index="item">
		#item#<br>
	</cfloop>
	<br><hr><br>
	<cfloop from="1" to="#listlen( myList )#" index="i">
		 #i#: #listGetAt( myList, i )#<br>
	</cfloop>
	<br><hr><br>	
	<cfset myList = "This is the test sentence">
	<cfloop list="#myList#" index="word" delimiters=" ">
	    #word#<br>
	</cfloop>
	
	<br><hr><br>
	<h3>Loop de Estrutura</h3>
	<cfset myStruct = { id= 123, nome= 'Francisco Paulino', dtNasc= '04/01/1975' }>
	<cfset StructInsert(myStruct,"email", "tofinha@gmailk.com", false) />
	<cfloop collection="#myStruct#" item="key">
		#key#: #myStruct[key]#<br>
	</cfloop>
	<cfdump var="#myStruct#">
</cfoutput>