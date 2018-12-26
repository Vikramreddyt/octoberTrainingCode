//reference Links : https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_schema.htm

public class selectAllSOQLExampleController {
    public List<Account> accList{get;set;}
    public String query{get;set;}
    public String query_EdiatbleFields{get;set;}
    public selectAllSOQLExampleController(){
    }
    public PageReference fetch(){
        String SobjectApiName = 'Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        //Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        //Schema.DescribeSObjectResult d =   SobjectApiName.sObjectType.getDescribe();
        //Map<String, Schema.FieldSet> FsMap =   d.fieldSets.getMap();
 
        String commaSepratedFields = '';
        for(String fieldName : fieldMap.keyset()){
            //system.debug('fieldName + Accessibility +++'+Schema.sobjecttype.SobjectApiName.fieldName.isAccessible());    
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = fieldName;
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;
            }
        }
        
        
        schemaMap.get(SobjectApiName).getDescribe().isAccessible();
 
        query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' Limit 5';
 
        accList = Database.query(query);
 
        return null;
    }
}