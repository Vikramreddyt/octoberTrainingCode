public class AccountCntlr_UsngSvrAndClientSideCntrl {
	@AuraEnabled
    public static List<Account> getAccountsWithOffset(String pageSize, String pageNumber){
        Integer ps = Integer.valueOf(pageSize);
        Integer pn = Integer.valueOf(pageNumber)-1;
        
        List<Account> accounts = [SELECT Id, Name, Phone, Rating, Active__c,Email_Id__c FROM Account LIMIT :Integer.valueOf(ps) OFFSET :(ps*pn)];
        return accounts;
    }
}