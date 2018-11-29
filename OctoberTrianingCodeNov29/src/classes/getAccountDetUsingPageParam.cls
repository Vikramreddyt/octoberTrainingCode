public with sharing class getAccountDetUsingPageParam {
    private final Id accountId;
    transient public final String accountName {get; set; }
    //public final Id accountId;
    //public final String accountName {get; set; }
    public getAccountDetUsingPageParam() {
        Account account = [select Id, Name from Account where id =:ApexPages.currentPage().getParameters().get('id')];
        accountId = account.Id;
        accountName = account.Name;
    }
    public PageReference save() {
        Account myAccount = [select name from Account where id =:accountId];
        myAccount.name = accountName;
        update myAccount;
        PageReference pr = new PageReference('/'+myAccount.id);
    return pr;
    }
    
}