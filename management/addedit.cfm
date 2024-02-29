<cftry>
    <cfparam name="book" default="" />
    <cfparam name="qTerm" default="" />

    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
    
    <div class="row">
        <div id="main" class="col-9">
            <cfif book.len() gt 0>
                <cfoutput>#mainForm()#</cfoutput>
            </cfif>
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
    <cfset var thisBookDetails= addEditFunctions.bookDetails(book) />
    <cfset var allPublishers = addEditFunctions.allPublishers() />
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit&book=#book#&qterm=#qterm#" method="post" enctype="multipart/form-data">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13" class="form-control" value="#thisBookDetails.isbn13#" placeholder="Please enter the ISBN13 of the book" />
                <label for="isbn13">ISBN 13: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" class="form-control" value="#thisBookDetails.title#" placeholder="Please enter the title of the book" />
                <label for="title">Book Title: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="year" name="year" class="form-control" value="#thisBookDetails.year#" placeholder="Please enter the year of publication of the book" />
                <label for="year">Year: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" step="1" id="pages" name="pages" class="form-control" value="#thisBookDetails.pages#" placeholder="Please enter the number of pages the book has" />
                <label for="isbn13">Number of Pages: </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" step=".1" id="weight" name="weight" class="form-control" value="#thisBookDetails.weight#" placeholder="Please enter the weight of the book" />
                <label for="isbn13">Weight: </label>
            </div>
            <div class="form-floating mb-3">
                <select class="form-select" id="publisherId" name="publisherId" aria-label="Publisher Select Control">
                    <option ></option>
                    <cfloop query="allPublishers">
                        <option value="#id#" #id eq thisbookDetails.publisherId ? "selected" : ""#>#name#</option>
                    </cfloop>
                </select>
                <label for="publisher">Publisher</label>
            </div>
            <div class="row">
                <div class="col">
                    <label for="uploadImage">Upload Cover</label>
                    <div class="input-group mb-3">
                        <input type="file" id="uploadImage" name="uploadimage" class="form-control" />
                        <input type="hidden" name="image" value="#trim(thisBookDetails.image[1])#" />
                    </div>
                </div>
                <div class="col">
                    <cfif thisBookDetails.image[1].len() gt 0>
                        <img src="../images/#trim(thisBookDetails.image[1])#" style="width:200px" />
                    </cfif>
                </div>
            </div>
            <div class="form-floating mb-3">
                <div><label for="description">Description</label></div>
                <textarea id="description" name="description">
                    <cfoutput>#thisBookDetails.description#</cfoutput>
                </textarea>
                <script>
                    ClassicEditor
                        .create(document.querySelector('##description'))
                        .catch(error => {console.dir(error)});
                </script>
                    
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%">Add Book</button> 
            
        </form>
        
    </cfoutput>
</cffunction>




<cffunction name="sideNav">
    <cfset var allbooks = addEditFunctions.sideNavBooks( qTerm )>  
    <div>
        Book List
    </div>
    <cfoutput>
        #findBookForm()#
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="#cgi.SCRIPT_NAME#?tool=addEdit&book=new">New Book</a>
            </li>
            <cfif qTerm.len() == 0>
                No Search Term Entered
            <cfelseif allbooks.recordcount ==0>    
                No Results Found
            <cfelse>
                <cfloop query="allbooks">
                    <li class="nav-item">
                        <a class="nav-link" href="#cgi.SCRIPT_NAME#?tool=addEdit&book=#isbn13#&qTerm=#qTerm#">#trim(title)#</a>
                    </li>
                </cfloop>
            </cfif>
        </ul>
    </cfoutput>
</cffunction>

<cffunction name="findBookForm">
    <cfoutput>
        <form action="#cgi.script_name#?tool=#tool#&book=#book#" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="qterm" name="qterm" class="form-control" value="#qterm#" placeholder="Enter a search term to find a book to edit" />
                <label for="qterm">Search Inventory </label>
            </div>
        </form>
    </cfoutput>
</cffunction>