@isTest
public class test_contactTrigger {
    public static testMethod void insertionOfContact(){
        account acc = new account(name = 'test Account', Email_Id__c = 'test@gmail.com');
        insert acc;
        test.startTest();
            contact c = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id);    
            insert c;
        test.stopTest();    
    }
    
    public static testMethod void insertAContactWithIsPrimaryFlagChecked(){
        account acc = new account(name = 'test Account', Email_Id__c = 'test@gmail.com');
        insert acc;
        contact c = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id);    
        insert c;
        test.startTest();
            c.is_Primary__c = true;
            update c;
        test.stopTest();    
    }
    public static testMethod void insertMultipleContactsWithIsPrimaryCheck(){
        account acc = new account(name = 'test Account', Email_Id__c = 'test@gmail.com');
        insert acc;
        contact c = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id);    
        insert c;
        test.startTest();
            c.is_Primary__c = true;
            update c;
            try {
                contact c1 = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id,is_Primary__c  = true);    
                insert c1;
            } catch(exception e){
            }
        test.stopTest();    
    }
    public static testMethod void insertMultipleContactsWithIsPrimaryCheck_Others(){
        account acc = new account(name = 'test Account', Email_Id__c = 'test@gmail.com');
        insert acc;
        contact c = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id,is_Primary__c  = true);    
        insert c;
        test.startTest();
            try {
                contact c1 = new contact(firstName = 'test Con' , LastName = '1',accountId = acc.id);
                insert c1;
                c1.is_Primary__c  = true;
                update c1;
            } catch(exception e){
            }
        test.stopTest();    
    }
}