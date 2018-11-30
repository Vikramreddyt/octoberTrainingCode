//https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/apex_ApexPages_StandardSetController_methods.htm
public class standardPaginationCon  {
    public Integer totalPages { get; set; }  
    public ApexPages.StandardSetController contactsSetController { get; set; }
    public List<Contact> Contacts {
        get {
            return (List<Contact>) contactsSetController.getRecords();
        }
    } 
 
    public standardPaginationCon  () {
        Decimal dtotalPages;
        Integer iRecordsPerPage = 20; 
        Database.QueryLocator qLoc;
        
        // You can initialize the set controller using a SOQL query:
        qLoc = Database.getQueryLocator([Select Id, Name, AccountId, FirstName, LastName From Contact c LIMIT 10000]);
        contactsSetController = new ApexPages.StandardSetController(qLoc);
        
        // Or with a list of records, which is useful for SOSL searches or if you already have the records in a list.
        // List<Sobject> lContacts = [FIND 'smith*' IN ALL FIELDS RETURNING Contact (Id, Name, AccountId, FirstName, LastName )][0];
        // contactsSetController = new ApexPages.StandardSetController(lContacts);
        
        // Create the set controller
 
        // Set the number of records to be displayed per page and calculate the number of pages.
        contactsSetController.setPageSize(iRecordsPerPage);
        dtotalPages = (contactsSetController.getResultSize() / contactsSetController.getPageSize());
        dtotalPages = Math.floor(dtotalPages) + ((Math.mod(contactsSetController.getResultSize(), iRecordsPerPage)>0) ? 1 : 0);
        totalPages = Integer.valueOf(dtotalPages);
    }
}