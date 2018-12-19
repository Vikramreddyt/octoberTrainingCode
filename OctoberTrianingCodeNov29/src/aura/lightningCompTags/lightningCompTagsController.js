/** Client-Side Controller **/
({
    navigateToCustomPage1: function (cmp, event) {
        event.preventDefault();
        //your custom navigation here
        console.log('Prevent the Redirection using 1st function');
        var navigateToSobject = cmp.find('navService');
        var pageReference = {
            type : 'standard__objectPage',
            attributes : {
                objectApiName:'Contact',
                actionName:'list'
            }, 
            state:{
                filterName:'00B6F00000Gk5wGUAR'      
            }    
        };
        navigateToSobject.navigate(pageReference);
    },
    navigateToCustomPage2: function (cmp, event) {
        event.preventDefault();
        //your custom navigation here
        console.log('Prevent the Redirection using 2nd function');
        var navigateToSobject_two = cmp.find('navService');
        var pageReference_Case = {
            type : 'standard__objectPage',
            attributes : {
                objectApiName:'Case',
                actionName:'list'
            }, 
            state:{
                filterName:"Recent"      
            }    
        };
        navigateToSobject_two.navigate(pageReference_Case);
    }
})