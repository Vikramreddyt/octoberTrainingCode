public with sharing class AccountMultipleSearchWithPagenationCLS {
    /*
        Variable Declarations
    */
    public Account acc{get;set;}
    public List<Account> accountList {get;set;}
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 10;

    public AccountMultipleSearchWithPagenationCLS(){
        system.debug('==>AccountMultipleSearchWithPagenationCLS  is calling==>');
        acc = new Account();
        //accountList  = new List<Account>();
    }

    public void searchAcc(){
        totalRecs = 0;
        OffsetSize = 0;
        if(accountList !=null && accountList.size()>0){
            accountList=null;
        }
        searchAccounts ();
        conditions.clear();
    }


    public Void searchAccounts(){

        System.debug('Total Records is ==>'+totalRecs);
        System.debug('OffsetSize is ==>'+OffsetSize);

        if(accountList != null && !accountList.isEmpty()){
          accountList.clear();
        }
        String strQuery ='SELECT Id,Name,AccountNumber,CreatedDate,Phone,Website,Industry,AnnualRevenue From Account';
        if(acc.Created_From_Date__c !=null){
            /*string fromDate = string.valueof(acc.Created_From_Date__c)+'';
            system.debug('++fromDate before Formatting++'+fromDate);
            fromDate = fromDate.split(' ',0)[0]+'T00:00:00.000Z';
            system.debug('++fromDate After Formatting++'+fromDate);*/
            date fromDate = acc.Created_From_Date__c;
            conditions.add('Created_From_Date__c >=:fromDate');
        }

        if(acc.Created_To_Date__c !=null){
            /*string toDate = string.valueOf(acc.Created_To_Date__c)+'';
            toDate = toDate.split(' ',0)[0]+'T23:59:59.000Z';*/
            date toDate = acc.Created_From_Date__c;
            conditions.add('Created_To_Date__c <=:toDate');
        }

        if(acc.Name !=null && acc.Name !=''){
            conditions.add('Name Like \'%' +acc.Name +'%\' ');
        }
        if(acc.AccountNumber !=null && acc.AccountNumber !=''){
            conditions.add('AccountNumber Like\'%' +acc.AccountNumber +'%\' ');
        }

        if (conditions.size() > 0) {
            strQuery += '  WHERE ' + conditions[0];
            for (Integer i = 1; i < conditions.size(); i++)
                    strQuery += '  AND ' + conditions[i];
            }
            system.debug('strQuery ==>'+strQuery+' +++'+conditions);
            if(totalRecs !=null && totalRecs ==0){
                List<Account> accTemp = Database.query(strQuery);
                totalRecs = (accTemp !=null &&accTemp.size()>0)?accTemp.size():0;
            }

            system.debug('strQuery ==>'+strQuery );
            // add sort and limits at the end  
            strQuery += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';

            accountList  =Database.query(strQuery);
            system.debug('+++accountList  +++'+accountList.size());
      //conditions.clear();
      //return accountList.size();
    }

    public void FirstPage()
    {
        OffsetSize = 0;
        searchAccounts();
        system.debug('FirstPage'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
    }
    public void previous()
    {
        OffsetSize = (OffsetSize-LimitSize);
        searchAccounts();
        system.debug('previous'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
    }
    public void next()
    {
        OffsetSize = OffsetSize + LimitSize;
        searchAccounts();
        system.debug('next'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
    }
    public void LastPage()
    {
        system.debug('LastPage'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        searchAccounts();
    }
    public boolean getprev()
    {
        system.debug('getprev'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
        if(OffsetSize == 0){

        return true;
        }
        else {

        return false;
        }
    }
    public boolean getnxt()
    {
        system.debug('getnxt'+'+++ Offset Limits++++'+OffsetSize+ ' ++LIMIT+++'+LimitSize+ ' ++TOTAL Records +++ '+totalRecs);
        if((OffsetSize + LimitSize) > totalRecs){
            return true;
        }
        else {
            return false;
        }
    }
}