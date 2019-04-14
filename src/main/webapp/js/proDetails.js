/**
 * Created by Administrator on 2015/12/8 0008.
 */
/*function picFun(){
    var picS = document.getElementsByClassName("pic");
    if(picS.length == 0)return false;
    for(var j=0;j<picS.length;j++){
        var ul = picS[j].getElementsByTagName("ul")[0];
        var lis = ul.getElementsByTagName("li");
        var num = lis.length;
        var all = document.getElementsByClassName("all");
        all[j].innerHTML = num;
        function width(str){
            for(var i=0;i<lis.length;i++){
                lis[i].style.width = str;
            }
        }
        ul.style.width = num*100+"%";
        switch (num){
            case 0:return false;
            case 1:return false;
            case 2:width("50%");break;
            case 3:width("33.4%");break;
        }
        picS[j].index = j;
        if(lis.length>1){
            touchFunc(picS[j],"left",leftTouch);
            touchFunc(picS[j],"right",rightTouch);
        }
    }
    function leftTouch(index){
        var pic = document.getElementsByClassName("pic")[index];
        var ul = pic.getElementsByTagName("ul")[0];
        var width = ul.style.width;
        var left = ul.style.left;
        var curr = document.getElementsByClassName("curr")[index];
        if(!left || left=="0px"){
            ul.style.left = "-100%";
            curr.innerHTML = "2";
        }else{
            var numLeft = left.match(/\d/);
            var numWidth = width.match(/\d/);
            if((parseInt(numLeft[0])+1) < parseInt(numWidth[0])){
                var newLeft = "-" + (parseInt(numLeft[0])+1)*100+"%";
                ul.style.left = newLeft ;
                curr.innerHTML = parseInt(numLeft[0])+2;
            }else{
                ul.style.left = "0px";
                curr.innerHTML = "1";
            }
        }
    }
    function rightTouch(index){
        var pic = document.getElementsByClassName("pic")[index];
        var ul = pic.getElementsByTagName("ul")[0];
        var width = ul.style.width;
        var left = ul.style.left;
        var curr = document.getElementsByClassName("curr")[index];
        if(!left || left=="0px"){
            var numWidth = width.match(/\d/);
            var newLeft = "-" + (parseInt(numWidth[0])-1)*100+"%";
            ul.style.left = newLeft;
            curr.innerHTML = parseInt(numWidth[0]);
        }else{
            var numLeft = left.match(/\d/);
            if((parseInt(numLeft[0])-1) > 0){
                var newLeft = "-" + (parseInt(numLeft[0])-1)*100+"%";
                ul.style.left = newLeft ;
                curr.innerHTML = parseInt(numLeft[0]);
            }else if((parseInt(numLeft[0])-1) == 0){
                ul.style.left = "0px";
                curr.innerHTML = 1;
            }
        }
    }
}*/


function suppor(){
    var support = document.getElementById("support");
    var supporting = document.getElementById("supporting");
    var supportBtn = document.getElementById("supportBtn");
    var contact = document.getElementById("contact");

    function supportFun(){
        Box.autoClose("投票成功！");
        var supportNum = parseInt(support.innerHTML);
        support.innerHTML = supportNum+1;
    }
   // supportBtn.onclick = supportFun;
   // supporting.onclick = supportFun;
//    contact.onclick = function(){Box.alert("请拨打SYE办公室电话028-69982528",function(){location.href='tel:02869982528';});
//    }
}
