component {

    function processForms( required struct formData ){
        if ( formData.keyExists( "isbn13" ) ) {
            var qs = new query( datasource = application.dsource );
            qs.setSql( "if NOT EXISTS( SELECT * FROM books WHERE isbn13=:isbn13)
                INSERT INTO books (isbn13,title) VALUES (:isbn13,:title); 
                UPDATE books SET 
                    title=:title,
                    year=:year,
                    pages=:pages,
                    weight=:weight
                    WHERE isbn13=:1sbn13
                " );
            qs.addParam(
               name      = "isbn13",
               cfsqltype = "CF_SQL_NVARCHAR",
               value     = trim(formData.isbn13),
               null = formData.isbn13.len()!=13
            );
            qs.addParam(
               name      = "title",
               cfsqltype = "CF_SQL_NVARCHAR",
               value     = trim(formData.title),
               null = formData.title.len() ==0
            );
            qs.addParam(
               name      = "year",
               cfsqltype = "CF_SQL_INTEGER",
               value     = trim(formData.year),
               null = !isValid("numeric",formData.year)
            );
            qs.addParam(
               name      = "pages",
               cfsqltype = "CF_SQL_INTEGER",
               value     = trim(formData.pages),
               null = !isValid("numeric",formData.pages)
            );
            qs.addParam(
               name      = "weight",
               cfsqltype = "CF_SQL_DECIMAL",
               value     = trim(formData.weight),
               null = !isValid("numeric",formData.weight)
            );
            qs.execute();
         }  
    } 

    function sideNavBooks(){
        var qs = new query(datasource=application.dsource);
        qs.setSql("select * from books");
        return qs.execute().getResult();
    }
}