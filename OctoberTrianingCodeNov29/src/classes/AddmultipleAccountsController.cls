public class AddmultipleAccountsController {
    Account account = new Account();
    public list<Account> listAccount{ get; set; }

    public AddmultipleAccountsController(){
        listAccount=new list<Account>();
        listAccount.add(account);
    }

    Public void addAccount(){
        Account acc = new Account();
        listAccount.add(acc);
    }
    public void saveAccount() {
        //List<acco
        //for(Integer i=0; i<listAccount.size(); i++){
            
        //}
        if(!listAccount.isEmpty()){
            try{
                insert listAccount;
                apexpages.addMessage(new ApexPages.message(ApexPages.severity.Confirm,'Accounts Inserted Successfully'));
                listAccount.clear();
                Account acc = new Account();
                listAccount.add(acc);
            }
            catch(Exception ex){
                System.debug('+++Ex++'+ex);
                apexpages.addMessages(ex);
            }    
        }
        //return null;//Page.Allaccountssaved;
    }
}