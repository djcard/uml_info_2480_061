<cftry><cfdump var="#form#" />
    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
    
    <div class="row">
        <div id="main" class="col-9">
            <cfoutput>#mainForm()#</cfoutput>
        </div>

        <div id="leftgutter" class="col-lg-3 order-first">
            <cfoutput>#sideNav()#</cfoutput>
        </div>
    </div>
    <cfcatch type="any">
        <cfoutput>
            #cfcatch#
        </cfoutput>
    </cfcatch>
</cftry>



<cffunction name="mainForm">
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13" class="form-control" value="" placeholder="Please enter the ISBN13 of the book" />
                <label for="isbn13">ISBN 13: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" class="form-control" value="" placeholder="Please enter the title of the book" />
                <label for="isbn13">Book Title: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="year" class="form-control" value="" placeholder="Please enter the year of publication of the book" />
                <label for="isbn13">Year: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" step="1" id="pages" name="pages" class="form-control" value="" placeholder="Please enter the number of pages the book has" />
                <label for="isbn13">Number of Pages: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" step=".1" id="weight" name="weight" class="form-control" value="" placeholder="Please enter the weight of the book" />
                <label for="isbn13">Weight: </label>
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%">Add Book</button>  
        </form>
    </cfoutput>
</cffunction>




<cffunction name="sideNav">
    <cfset allbooks = addEditFunctions.sideNavBooks()>  
    <div>
        Book List
    </div>
    <cfoutput>
        <ul class="nav flex-column">
        <cfloop query="allbooks">
            <li class="nav-item">
                <a class="nav-link">#trim(title)#</a>
            </li>
        </cfloop>
        </ul>
    </cfoutput>
</cffunction>