({
    doInit:function(component,event,helper){
       var cmpTarget = component.find('changeIt');
        $A.util.addClass(cmpTarget, 'onloadColor'); 
    },
    applyCSS: function(cmp, event) {
        var cmpTarget = cmp.find('changeIt');
        $A.util.removeClass(cmpTarget, 'onloadColor');
        $A.util.addClass(cmpTarget, 'changeMe');
        //changeMe is the style class name with attribute like backgroung color and width
        //cmpTarget is the area on which we need to apply the styling
    },
    removeCSS: function(cmp, event) {
        var cmpTarget = cmp.find('changeIt');
        $A.util.removeClass(cmpTarget, 'onloadColor');
        $A.util.removeClass(cmpTarget, 'changeMe');
        //changeMe is the style class name with attribute like backgroung color and width
    }
})