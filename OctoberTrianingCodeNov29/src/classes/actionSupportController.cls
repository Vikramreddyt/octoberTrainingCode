public with sharing class actionSupportController {
    Integer count = 0;
                        
    public PageReference incrementCounter() {
            count++;
            return null;
    }
                    
    public Integer getCount() {
        return count;
    }
}