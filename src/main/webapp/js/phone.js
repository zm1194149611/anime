/**
 * 手机端的触发事件
 * @param obj  => 是需要添加事件的对象
 * @param type => 事件的类型
 *                start  => 手指触摸事件
 *                move   => 手指移动事件
 *                left   => 手指向左滑动事件
 *                right  => 手指向右滑动事件
 *                top    => 手指向上滑动事件
 *                down   => 手指向下滑动事件
 *                long   => 长按事件
 *                click  => 点击事件
 *                end    => 结束时间
 * @param func => 回调函数
 */

function touchFunc(obj,type,func) {
    //滑动范围在5x5内则做点击处理，s是开始，e是结束
    var init = {x:5,y:5,sx:0,sy:0,ex:0,ey:0};
    var sTime = 0, eTime = 0;
    // 转化为小写
	type = type.toLowerCase();
    
	obj.addEventListener("touchstart",function(){
		sTime = new Date().getTime();
        init.sx = event.targetTouches[0].pageX;
        init.sy = event.targetTouches[0].pageY;
        init.ex = init.sx;
        init.ey = init.sy;
        // indexOf('') 查找字符在指定字符串中第一次出现的位置   如果字符串不存在返回-1
        if(type.indexOf("start") != -1) func(obj.index);
	}, false);

    obj.addEventListener("touchmove",function() {
    	// 防止链接打开 URL  阻止触摸时浏览器的缩放、滚动条滚动
        event.preventDefault();
        init.ex = event.targetTouches[0].pageX;
        init.ey = event.targetTouches[0].pageY;
        if(type.indexOf("move")!=-1) func(obj.index);
    }, false);

    obj.addEventListener("touchend",function() {
        var changeX = init.sx - init.ex;
        var changeY = init.sy - init.ey;
        // Math.abs() 返回一个数字的绝对值
        if(Math.abs(changeX)>Math.abs(changeY) && Math.abs(changeY)>init.y) {
            //左右事件
            if(changeX > 0) {
                if(type.indexOf("left")!=-1) func(obj.index);
            }else{
                if(type.indexOf("right")!=-1) func(obj.index);
            }
        }
        else if(Math.abs(changeY)>Math.abs(changeX) && Math.abs(changeX)>init.x){
            //上下事件
            if(changeY > 0) {
                if(type.indexOf("top")!=-1) func(obj.index);
            }else{
                if(type.indexOf("down")!=-1) func(obj.index);
            }
        }
        else if(Math.abs(changeX)<init.x && Math.abs(changeY)<init.y){
            eTime = new Date().getTime();
            //点击事件，此处根据时间差细分下
            if((eTime - sTime) > 300) {
                if(type.indexOf("long")!=-1) func(obj.index); //长按
            }
            else {
                if(type.indexOf("click")!=-1) func(obj.index); //当点击处理
            }
        }
        if(type.indexOf("end")!=-1) func(obj.index);
    }, false);
};