//https://openweathermap.org/api
//Visit the URL and Create a user for yourself , to get the customer key
// Make a remote site Setting : https://openweathermap.org

public with sharing class AccountWeatherController {

    public String city {get;set;}
    public string temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}

    public AccountWeatherController(ApexPages.StandardController stdController) {
        Account account = (Account)stdController.getRecord();
        account = [SELECT Id, ShippingCity FROM Account WHERE Id =:account.Id];
        
        String accountCity = account.ShippingCity;
        String apiKey = '15eef6541737ebfa51f183bb46b88579';

        String requestEndpoint = 'http://api.openweathermap.org/data/2.5/weather';
        requestEndpoint += '?q=' + accountCity;
        requestEndpoint += '&units=metric';
        requestEndpoint += '&APPID=' + apiKey;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
           
           // Deserialize the JSON string into collections of primitive data types.
           system.debug('++response.getBody()+++'+response.getBody());
           object responseObj = JSON.deserializeUntyped(response.getBody());
           system.debug('++responseObj+++'+responseObj);

           Map<String, Object> responseObjMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(responseObj));
           Map<string,string> mainResults = new Map<string,string>();
           for(string str : responseObjMap.keySet()){
               mainResults.put(str,string.valueof(responseObjMap.get(str)));
               system.debug('+++str+++'+str+' '+string.valueof(responseObjMap.get(str)));
           }
           city = mainResults.get('name');
           Map<string,string> mainResultsParams = new Map<string,string>();
           string allValues = string.valueOf(mainResults.get('main'));
           
           List<String> getAllValues =  allValues.split(',');
           system.debug('+++Main++++'+mainResults.get('main')+'   +++allValues ++++'+allValues+ '  +++getAllValues +++'+getAllValues);
           Map<string,string> getAllValuesMap = new Map<string,string>();
           
            for(string s : getAllValues){
               List<string> getSplittedValues = s.split(',');
               system.debug('+++getSplittedValues++'+getSplittedValues);
                for(string str : getSplittedValues){
                   str = str.replaceAll( '\\s+', '');
                   str = str.replace( '{', '');
                   str = str.replace( '}', '');
                   List<string> strLst = str.split('=');
                   system.debug('+++strLst ++++ [0]'+strLst[0]+'+++strLst ++++ [1]'+strLst[1]);
                   getAllValuesMap.put(strLst[0],strLst[1]);
                }
            }
            system.debug('+++getAllValuesMap Keys++++'+getAllValuesMap.keySet()+'+++getAllValuesMap Values++++'+getAllValuesMap.values());
            pressure = getAllValuesMap.get('pressure');
            temp = getAllValuesMap.get('temp');
            humidity = getAllValuesMap.get('humidity');
            temp_min = getAllValuesMap.get('temp_min'); 
            temp_max = getAllValuesMap.get('temp_max');
            system.debug('+++pressure ++++'+pressure+' +++humidity +++++'+humidity+' ++temp_min +++++'+temp_min+' +++temp_max ++++'+temp_max+'humidity+++'+humidity);
        
        } else {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error retrieving the weather information.');
           ApexPages.addMessage(myMsg);
        }
    

    }
}