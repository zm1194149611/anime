/**
 * Created by Administrator on 2015/12/9 0009.
 */
//所有箭头朝下
function arrowsClose(){
    var titleNum = document.getElementsByClassName("title");
    for(var j=0;j<titleNum.length;j++){
        var spanA = titleNum[j].getElementsByTagName("span")[0];
        spanA.style.borderBottom = "0" ;
        spanA.style.borderTop = "6px solid #e0485e" ;
    }
}
//所有选项卡消失
function cardClose(){
    var choose = document.getElementsByClassName("choose");
    for(var j=0;j<choose.length;j++){
        var ulS = choose[j].getElementsByTagName("ul");
        for(var i=0;i<ulS.length;i++){
            ulS[i].style.display = "none";
        }
    }
}
//绑定选项信息
function listSonBind(parent){
    var id = parent + "List";
    var listElem = document.getElementById(id);
    var liS = listElem.getElementsByTagName("li");
    var id_s = parent+"_s";
    for(var i=0;i<liS.length;i++){
        liS[i].parentId = parent;
        liS[i].onclick = function(){
            var value = this.getElementsByTagName("span")[0].innerHTML;//选择的结果
            var parent = document.getElementById(this.parentId);
            parent.title = value;
            var labelPar = parent.getElementsByTagName("label")[0];
            labelPar.innerHTML = value;
            
            var parent_s = document.getElementById(id_s);
            parent_s.value=this.getAttribute("value");
            
            arrowsClose();
            cardClose();
        };
    }
}
//点选选项卡
function selectedCard(){
    var titleS = document.getElementsByClassName("title");
    for(var i=0;i<titleS.length;i++){
        titleS[i].onclick = function(){
            //选项卡消失/出现
            var Id = this.id + "List";
            var list = document.getElementById(Id);
            var view = list.style.display;
            if(view == "none"){
                cardClose();
                list.style.display = "block";
                //改变箭头方向
                arrowsClose();
                var span = this.getElementsByTagName("span")[0];
                span.style.borderBottom = "6px solid #e0485e" ;
                span.style.borderTop = "0" ;
                listSonBind(this.id);
            }else{
                arrowsClose();
                list.style.display = "none";
            }
        }
    }
}


