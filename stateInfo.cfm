<cfset stateFunctions = createObject("stateInfo") />

<cfif p == "logoff">
    <cfset session.clear()/>
    <cfset p="carousel" />
</cfif>

<cfif !session.keyExists("user")>
    <cfset session["user"] = stateFunctions.obtainUser() />
</cfif>

<cfif form.keyExists("firstname")>
    <cfset newAccountResult = stateFunctions.processNewAccount(form) />
    <cfset accountMessage = newAccountResult.message />
</cfif>

<cfif form.keyExists("loginpass")>
    <cfset userData = stateFunctions.logMeIn(form.loginemail, form.loginpass) />

    <cfif userData.recordcount == 1>
        <cfset session.user = stateFunctions.obtainUser(
            isLoggedIn = 1,
            firstname = userData.firstName[1],
            lastname = userData.lastName[1],
            email = userData.email[1],
            accountNumber = userData.personId[1],
            isAdmin = userData.isAdmin[1]
        ) />
        <cfset p="carousel" />
    <cfelse>
        <cfset loginmessage = "The Login did not work!" />
    </cfif>
</cfif>



