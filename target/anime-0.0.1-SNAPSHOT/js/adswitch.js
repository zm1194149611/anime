function move(){
    var picBox = document.getElementsByClassName("picBox")[0];
    var picIndex = document.getElementById("picIndex");
    var lis = picBox.getElementsByTagName("li");
    var spanS = picIndex.getElementsByTagName("span");
    if(T > 4){
        //第一个li变为最后一个
        var lastLi = lis[0];
        picBox.removeChild(lis[0]);
        picBox.appendChild(lastLi);
        //新的第一个li，把left设为0，取他的index
        var firstLi = lis[0];
        firstLi.style.left = "0px";
        var index = firstLi.index;
        //将span全部设为未选中，将第index个span设为选中；
        for(var i=0;i<spanS.length;i++){
            spanS[i].className = "";
        }
        spanS[index].className = "selectedSpan";
        clearInterval(moveS);
    }else{
        var oldLeft = lis[0].style.left;
        lis[0].style.left = "-"+20*(T+1)+"%";
        T++;
    }
}
//页面切换
function imgChange(){
    var picBox = document.getElementById("picBox");
    var lis = picBox.getElementsByTagName("li");
    //ul的背景变为第二个li的图片资源
    var secondLiImg = lis[1].getElementsByTagName("img")[0];
    var srcBg = secondLiImg.src;
    picBox.style.backgroundImage = "url('"+srcBg+"')";
    //向左切换效果
    T=0;
    moveS = setInterval(move,50);
}
//banner调用主函数
function banner(){
    var picBox = document.getElementById("picBox");
    var picIndex = document.getElementById("picIndex");
    var Lis = picBox.getElementsByTagName("li");
    for(var i=0;i<Lis.length;i++){
        var span = document.createElement("span");
        Lis[i].index = i;
        picIndex.appendChild(span);
    }
    var spanS = picIndex.getElementsByTagName("span");
    spanS[0].className = "selectedSpan";
    setInterval(imgChange,3000);
}