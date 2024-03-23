<cfparam name="loginMessage" default="a" />


<h2>Login</h2>

<cfoutput>
    <div id="loginmessage">#loginMessage#</div>
<form action="#cgi.SCRIPT_NAME#?p=login" method="POST">
    <div class="form-floating mb-3">
        <input type="text" id="loginemail" name="loginemail" class="form-control" placeholder="Please enter your Email" required />
        <label for="loginemail">Email </label>
    </div>
    <div class="form-floating mb-3">
        <input type="password" id="loginpass" name="loginpass" class="form-control" placeholder="Please enter password" required />
        <label for="loginpass">Password </label>
    </div>
    <div class="form-floating mb-3">
        <input type="submit" class="btn btn-primary" value="Login" style="width:100%" />
    </div>


</form>

</cfoutput>