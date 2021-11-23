<h3>Setando variáveis</h3>
<cfset ThisIs = "fun">
<cfdump var = "#ThisIs#">
<br><hr><br>
<cfdump var = "1 + 2"><br>
<cfdump var = "#1 + 2#"><br>
<cfdump var = "1 + 2 IS #1 + 2#"><br>
<br><hr><br>
<cfset UserBirthdate = "12/26/1975">
<cfset DateToday = now()>
<cfdump var = "#DateToday#">
<br><hr><br>
<h3>Concactenando Variáveis/Strings</h3>
<br>
<cfset DateToday = "Today is: #now()#">
<cfdump var = "#DateToday#">
<br><hr><br>
<cfset DateToday = "Today is: ">
<cfset DateToday = DateToday & now()>
<cfdump var = "#DateToday#">
<br><hr><br>
<cfset DateToday = "Today is: #now()#">
<cfdump var = "#DateToday#">
<br><hr><br>
<h3>Dumps de Array e Estruturas</h3>
<cfset DateArray = [dateFormat(now(), "short"), dateFormat(dateadd('d',1,now()), "short"), dateFormat(dateadd('d',2,now()), "short")]>
<cfdump var = "#DateArray#">
<br><hr><br>
<cfset DateStruct = { today=dateFormat(now(), "short"), tomorrow=dateFormat(dateadd('d',1,now()), "short"), later=dateFormat(dateadd('d',2,now()), "short") }>
<cfdump var = "#DateStruct#">