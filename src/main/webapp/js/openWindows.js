var clickOpenWin=function(f){
    var dataKey = "clickOpenWin.dataKey"
    var me = $(this);
    var A = me.data(dataKey);
    var returnData = null;
    if(!A){
        A = $("");
        me.data(dataKey, A);
        A.click(function(e){
            if(returnData){
                A.attr("href", returnData);
            }else {
                A.before(me);
                e.stop();
            }
        });
    }
    me.mouseover(function(){$(this).before(A).appendTo(A);});
    me.mouseout(function(){A.before($(this));});
    me.click(function(){
        A.attr("href", "#|");
        returnData = f.apply(this, arguments);
    });
}