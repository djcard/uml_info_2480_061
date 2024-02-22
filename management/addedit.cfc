component {

    function processForms( required struct formData ){
        if ( formData.keyExists( "isbn13" ) ) {
            var qs = new query( datasource = application.dsource );
            qs.setSql( "insert into books (isbn13,title) values (:isbn13,:title)" );
            qs.addParam(
               name      = "isbn13",
               cfsqltype = "CF_SQL_NVARCHAR",
               value     = trim(formData.isbn13)
            );
            qs.addParam(
               name      = "title",
               cfsqltype = "CF_SQL_NVARCHAR",
               value     = trim(formData.title)
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