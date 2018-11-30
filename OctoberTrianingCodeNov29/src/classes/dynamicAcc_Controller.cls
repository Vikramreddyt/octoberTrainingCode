public with sharing class dynamicAcc_Controller{

public List<Account> accLst{get;set;}
public String searchStr{get;set;}  
public boolean accNew{get;set;}  
Account a;


    public dynamicAcc_Controller(ApexPages.StandardController controller) {
      accLst = new List<Account>();
      accNew = false;
    }
    
      public PageReference  strSearch(){
       System.debug('Search String++ '+searchStr);
       string str = '%'+searchStr+'%';
       accLst = [Select name,phone from account where name like:str ];
       //accLst = [Select name,phone from account where name LIMIT 199 OFFSET 190 ]; 
       system.debug('AccList++'+accLst);
       if(accLst.size()==0)
        accNew= true;
       else
        accNew= false;   
       return null;
    }
    public PageReference  redirectPage(){
       PageReference  pr = new PageReference('/001/e?acc2='+searchStr+'&retURL=%2F001%2Fo');
       return pr;
    }
    

     
}