({
    doInit:function(component,event,helper){
        alert('doinit Method is invoked');
        console.log(' Default Hightlited Section Name : '+component.find("accordion").get('v.activeSectionName'));
    },
    handleShowActiveSectionName: function (cmp, event, helper) {
        alert(cmp.find("accordion").get('v.activeSectionName'));
    },
    handleSetActiveSectionC: function (cmp) {
        cmp.find("accordion").set('v.activeSectionName', 'C');
    },
    handleSetActiveSectionA: function (cmp) {
        cmp.find("accordion").set('v.activeSectionName', 'A');
    },
    handleSetActiveSectionB:function(component){
        component.find("accordion").set('v.activeSectionName','B');
    }
})