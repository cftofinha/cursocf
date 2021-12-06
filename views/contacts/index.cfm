<cfoutput>
<h1>My Contacts</h1>
<cfdump var="#prc.aContacts#">
#html.table( data=prc.aContacts, class="table table-striped" )#
</cfoutput>