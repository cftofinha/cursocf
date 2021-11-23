<h3>Strings/Numbers</h3>
<cfset aString = "hi">
<cfset aNumber = 42>
<cfset aStringAndANumber = aString & aNumber>

aString: <cfoutput>#aString#</cfoutput><br>
aNumber: <cfoutput>#aNumber#</cfoutput><br>
aStringAndANumber: <cfoutput>#aStringAndANumber#</cfoutput><br>
<br><br>
<cfsavecontent variable="EmailContent">
	Testando
	Conteúdo para e-mail
	Tudo OK
	Vamos lá
</cfsavecontent>
<cfoutput>#EmailContent#</cfoutput>

<br><hr><br>
<h3>Dates</h3>
<cfset DateToday = now()>
<cfset NewYearDay = "1/1/2019">
<cfset diferencaEmDias = DateDiff("d", "11/18/2021", now() )>
<cfoutput>
	data Atual = #DateToday# <br>
	diferencaEmDias = #diferencaEmDias#
</cfoutput>
<br><br>
<cfset FortyTwoDaysFromNow = DateAdd("d", now(), 42 )>
<cfoutput>FortyTwoDaysFromNow = #FortyTwoDaysFromNow#</cfoutput>

<br><hr><br>
<h3>Arrays</h3>
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42]>
<cfdump var = "#ThingsILike#">
<br><br>
<cfset ThingsILike = arrayNew(1)>
<cfset ThingsILike[1]  = "Warm Sandy Beaches">
<cfdump var="#ThingsILike#">
<br><br>
<cfset ArrayAppend( ThingsILike,  "Tropical Drinks")>
<cfset ArrayAppend( ThingsILike,  42)>
<cfdump var="#ThingsILike#">
<br><br><br><br>
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42]>
<cfloop array="#ThingsILike#" index="thing">
    <cfoutput>#thing#</cfoutput>
</cfloop>

<br><hr><br>
<h3>Structs</h3>
<cfset FruitBasket = structNew()>
<cfset FruitBasket = {}>

<h5>Struct: Bracket Notation</h5>
<cfset FruitBasket["Apple"] = "Like">
<cfset FruitBasket["Banana"] = "Like">
<cfset FruitBasket["Cherry"] = "Dislike">
<cfdump var = "#FruitBasket#">
<br><br><br>

<h5>Struct: Dot Notation</h5>
<cfset FruitBasket = {}>
<cfset FruitBasket.Apple = "Like">
<cfset FruitBasket.Banana = "Like">
<cfset FruitBasket.Cherry = "Dislike">

<cfdump var = "#FruitBasket#">

<br><br><br>
<h5>Array to Structn</h5>
<cfscript>
	arr = [];
	arr[1] = {nome="Warm Sandy Beaches"};
	writeDump(arr);
</cfscript>

<br><br><br>
<cfset objDate = {
	Pickup = "7:45 PM",
	Dinner = "Outback Steak House",
	Movie = StructCreate(
		Name = "28 Weeks Later",
		Time = "7:45 PM"
		),
	Dessert = "Cafe Lalo"
	} />
	
<cfdump
	var="#objDate#"
	label="Implicit Struct Creation / UDF Test"
	/>
	
<br><br><br>
<h5>Array of Struct</h5>
<cfset arrData = [] />
<cfset arrData[ 1 ] = { Movie = "Mixed Nuts", Time = "7:45 PM" } />


<cfdump
	var="#arrData#"
	label="Implicit Struct Creation w/ Array Set"
	/>
	

<cffunction
	name="StructCreate"
	access="public"
	returntype="struct"
	output="false"
	hint="Creates a struct based on the argument pairs.">

	<!--- Define the local scope. --->
	<cfset var LOCAL = StructNew() />

	<!--- Create the target struct. --->
	<cfset LOCAL.Struct = StructNew() />

	<!--- Loop over the arguments. --->
	<cfloop
		item="LOCAL.Key"
		collection="#ARGUMENTS#">

		<!--- Set the struct pair values. --->
		<cfset LOCAL.Struct[ LOCAL.Key ] = ARGUMENTS[ LOCAL.Key ] />

	</cfloop>

	<!--- Return the resultant struct. --->
	<cfreturn LOCAL.Struct />
</cffunction>