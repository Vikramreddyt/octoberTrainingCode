public with sharing class paginationjquery {
    public list<Account> acc{get;set;}
    public paginationjquery() {
        acc=new list<Account>();
        onLoad();
    }
    public void onLoad(){  //This function get called automatically on on load
 
        acc=[Select ID,Name,Phone,AccountNumber,Sic from Account limit 520];
 
 
    }
}