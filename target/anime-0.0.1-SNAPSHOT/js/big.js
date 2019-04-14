/**
 * Created by Administrator on 2015/12/9 0009.
 */

    //计算重复内容时间
function timeFun(){
    var screenHeight = window.screen.height;
    var bodyHeight = document.body.scrollHeight;
    var scrollTop = document.body.scrollTop;
    var y = bodyHeight-screenHeight-scrollTop;
    timeNew = y*30;
}
//滑动条快到底部时重复滚动
function newElem(){
    timeFun();
    document.getElementsByTagName("article")[0].innerHTML += articleContent;
    setTimeout(newElem,timeNew);
}
//向上移动
function scroll(){
    document.body.scrollTop += 1;
}

window.onload = function(){
    setInterval(scroll,31);
    timeFun();
    articleContent = document.getElementsByTagName("article")[0].innerHTML;//初始内容长度
    setTimeout(newElem,timeNew);
};