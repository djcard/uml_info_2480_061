<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Week 5 Source Code</title>
    </head>
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous"
    >

    <script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"
    ></script>
    <link href="../includes/css/class.css" rel="stylesheet"/>
    <link href="../includes/css/mycss.css" rel="stylesheet"/>
    <body>
        <cfdirectory action="list" directory="#expandPath(".")#" name="mainarea" recurse="no">
        <cfdirectory action="list" directory="#expandPath("management")#" name="managearea" recurse="no">
        <cftry>
            <div id="wrapper" class="container">
            <legend>Week 5</legend>
            <div>This week's main objective is to create the structure and first module of the management portion of the site.</div>
            <div class="row">
                <div class="col-lg-3">
                    <legend>Main Site</legend>
                    <cfoutput>
                        <ul class="nav flex-column">
                            <cfloop query="mainarea">
                                <cfif type eq 'file'>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#cgi.SCRIPT_NAME#?page=#name#">#name#</a>
                                    </li>
                                </cfif>
                            </cfloop>
                        </ul>
                        <legend>Management</legend>
                        <ul class="nav flex-column">
                            <cfloop query="managearea">
                                <cfif type eq 'file'>
                                    <li class="nav-class">
                                        <a class="nav-link" href="#cgi.SCRIPT_NAME#?page=management/#name#">#name#</a>
                                    </li>
                                </cfif>
                            </cfloop>
                        </ul>
                    </cfoutput>
                </div>
                <div class="col-lg-9">
                    <cfif isDefined('url.page')>
                        <cffile action="read" file="#expandPath(".")#/#url.page#" variable="sourcecode"/>
                        <pre>
                            <cfoutput>
                                <cfdump var="#sourcecode#">
                            </cfoutput>
                        </pre>
                    </cfif>
                </div>
            </div>
            <cfcatch type="any">
                <cfdump var="#cfcatch#"/>
            </cfcatch>
        </cftry>
    </body>
</html>
