public class exampleCon {
    
    public String state { get; set; }

    public String username { get; set; }
    
    public Integer count{get;set;}
                        
    public exampleCon(){
        count = 0;
    }

    
    public PageReference methodOne() {
        incrementCounter();    
        system.debug('++Count Variable+++'+count);
        return null;
    }


    
    public string sayHello() {
        username = userinfo.getName(); 
        return null;
    }

    public PageReference incrementCounter() {
        count++;
        return null;
    }
                        
    public Integer getCount() {
        return count;
    }
}