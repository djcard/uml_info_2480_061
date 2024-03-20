
component {
    

    function obtainSearchResults( searchMe ){

        var qs = new query(datasource=application.dsource);
        qs.setSql("select * from books where title like :searchme or isbn13=:isbn13 ;")
        qs.addParam(name="searchme",value="%#searchme#%");
        qs.addParam(name="isbn13", value="#searchme#");
        return qs.execute().getResult();
        
    }


}