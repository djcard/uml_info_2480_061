<cfparam name="searchMe" default="" />

<cfoutput>
    <cfset bookinfo = bookstoreFunctions.obtainSearchResults( searchme ) />

    <cfif bookinfo.recordcount == 0>
        There were no results. Please search again. 
    <cfelseIf bookinfo.recordcount == 1>
        <cfset oneResult()/>
    <cfelse>   
        <cfset manyResults() />


    </cfif>

    <cfdump var="#bookinfo#" />
</cfoutput>



<cffunction name="oneResult">
    <cfoutput>
        <h2>Search Results</h2>
        <div class="row">
            <div class="col-6">
                <img src="images/#bookinfo.image[1]#" style="width:100px" />
            </div>
            <div class="col-6">
                Title: #bookinfo.title[1]#<br/>
                Year: #bookinfo.year[1]#<br/>
                Pages: #bookinfo.pages[1]#<br/>
                Description: #bookinfo.description[1]#
            </div>
        </div>
    </cfoutput>
</cffunction>



<cffunction name="manyResults">
    <cfoutput>
        <div>
            <div> I found #bookinfo.recordcount# books</div>
            <div>
                <ol class="nav flex-column">
                    <cfloop query="bookInfo">
                        <li class="nav-item">
                            <a class="nav-link" href="#cgi.SCRIPT_NAME#?p=details&searchme=#isbn13#">
                                #title#
                            </a>
                        </li>
                    </cfloop>
                </ol>
            </div>
        </div>
</cfoutput>
</cffunction>