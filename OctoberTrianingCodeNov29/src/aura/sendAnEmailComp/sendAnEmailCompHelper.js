//Helper
({
    sendHelper: function(component, getEmail, getSubject, getbody) {
        // call the server side controller method 	
        // Syntax to call an apex method which is auraEnabled in the Controller :
        // var action = componnet.get("aura enabled Method Name"); Step 1 
        // Step 2: 
        // we need to send parameters for that we will be using "action.setParams"
        // signature is ation.setParams({ 'variable name should be same as apex signature var' : helper/Controller variable ,});
        // Step 2 Ends.
        // Step 3 : action.setCallback(this,function(response)){var state = response.getState();};
        // step 4 : we need to enque the action  .. $A.enqueueAction(action);
        var action = component.get("c.sendMailMethod");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            'mMail': getEmail,
            'mSubject': getSubject,
            'mbody': getbody
        });
        action.setCallback(this, function(response) {
            console.log('+++response+++'+response);
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if state of server response is comes "SUCCESS",
                // display the success message box by set mailStatus attribute to true
                component.set("v.mailStatus", true);
            }
 
        });
        $A.enqueueAction(action);
    },
})