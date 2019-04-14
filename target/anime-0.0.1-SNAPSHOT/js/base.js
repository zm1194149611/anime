/**
 * Created by Tantake on 2016/3/18.
 */
window.onload=function(){
    var write=document.getElementById('write');
    var discuss=document.getElementById('discuss');
    write.onclick= function () {
        window.open("question.html","_self");

    };
    discuss.onclick=function(){
        Box.leaveMessage();
    }
};
