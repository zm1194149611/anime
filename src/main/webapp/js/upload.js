/**
 * Created by Tantake on 2016/3/23.
 */
function test(){
    var submit = document.getElementById("submit");
    var name = document.getElementById("name");
    var resPerson = document.getElementById("resPerson");
    var projIntroduce = document.getElementById("projIntroduce");
    var operation = document.getElementById("operation");
    var plan = document.getElementById("plan");
    var teamIntroduce = document.getElementById("teamIntroduce");
    var logo = document.getElementById("logo");
    var indexPic = document.getElementById("indexPic");
    var projPic = document.getElementById("projPic");
    var teamPic = document.getElementById("teamPic");
    var status = document.getElementsByName("status");
    var zone = document.getElementsByName("zone");
    var business = document.getElementsByName("business");

    function radio(elem){
        for(var i=0;i<elem.length;i++){
            if(elem[i].checked==true){
                return true;
            }
        }
    }


    submit.onclick = function(){
        if(name.value == "" || resPerson.value == "" || projIntroduce.value == "" || operation.value == "" ||
            plan.value == "" || teamIntroduce.value == "" || radio(status) != true || radio(zone) != true ||
            radio(business) != true){
            alert("请将所有信息填写完整");
            return false;
        }
        if(logo.value == "" || indexPic.value == "" ){
            alert("请选择图片");
            return false;
        }
        if(projPic.files.length > 3){
            alert("项目照片最多选择3张，请重新选择！");
            return false;
        }else if(projPic.files.length == 0){
            alert("请至少上传一张项目照片");
            return false;
        }
        if(teamPic.files.length > 3){
            alert("团队照片最多选择3张，请重新选择！");
            return false;
        }else if(teamPic.files.length == 0){
            alert("请至少上传一张团队照片");
            return false;
        }

    }
}
function textCounter(field, maxlimit) {
    if (field.value.length > maxlimit){
        field.value = field.value.substring(0, maxlimit);
    }else{
        var parent = field.parentNode;
        var label = parent.getElementsByTagName("label")[0];
        label.innerHTML = maxlimit - field.value.length;
    }
}
function fontNum(fieldId,maxlimit){
    var field =document.getElementById(fieldId);
    field.onkeyup = function(){
        if (field.value.length > maxlimit){
            field.value = field.value.substring(0, maxlimit);
        }else{
            var parent = field.parentNode;
            var label = parent.getElementsByTagName("label")[0];
            label.innerHTML = maxlimit - field.value.length;
        }
    };
}
window.onload = function(){
    test();
    selectedCard();
    fontNum("projIntroduce",30);
    fontNum("operation",100);
    fontNum("plan",100);
    fontNum("teamIntroduce",100);
};