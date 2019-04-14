/**
 * Created by Administrator on 2015/12/7 0007.
 */

function newPasswordTest(){
    var testCode = document.getElementById("testCode");
    var update = document.getElementById("update");
    var tel = document.getElementById("tel");
    var test = document.getElementById("test");
    var password = document.getElementById("password");
    var newPassword = document.getElementById("newPassword");
// 移动手机匹配规则
    var yd_str = /^1(3[4-9]|47|5[012789]|8[23478])[0-9]{8}$/;
// 联通手机匹配规则
    var lt_str = /^1(3[0-2]|45|5[56]|8[56])[0-9]{8}$/;
// 电信手机匹配规则
    var dx_str = /^(18[019]|1[35]3)[0-9]{8}$/;

    function telTest(){
        if(tel.value == ""){
            Box.autoClose("请输入您的手机号");
            return false;
        }
        if(!yd_str.test(tel.value) || !lt_str.test(tel.value)|| !dx_str.test(tel.value)){
            Box.autoClose("您的手机号码有误，请重新输入");
            tel.value = "";
            return false;
        }
    }

    function testAll(){
        if(!password.value || !newPassword.value || !tel.value || !test.value){
            Box.autoClose("请将所有信息填写完整");
            return false;
        }
        if(yd_str.test(tel.value) || lt_str.test(tel.value) || dx_str.test(tel.value)){}else{
            Box.autoClose("您的手机号码有误，请重新输入");
            tel.value = "";
            return false;
        }
        if(password.value != newPassword.value){
            Box.autoClose("两次密码输入不一致，请重新填写");
            password.value = "";
            newPassword.value = "";
            return false;
        }
        afterUpdatePWDCheck({code:test.value,phone:tel.value,pwd:password.value,newPwd:newPassword.value});
        
    }

    testCode.onclick = telTest;
    update.onclick = testAll;
}

function afterUpdatePWDCheck(data){
	Box.autoClose("请实现修改提交方法");
}

function SYEcheck(){
    var role = document.getElementById("role");
    var roleSon = document.getElementsByClassName("roleSon")[0];
    var sonS= roleSon.getElementsByTagName("div");
    var submit = document.getElementById("submit");

    for(var i=0;i<sonS.length;i++){
        sonS[i].onclick = function(){
            var spanS = roleSon.getElementsByTagName("span");
            for(var j=0;j<spanS.length;j++){
                spanS[j].style.opacity = 0;
            }
            var span = this.getElementsByTagName("span")[0];
            span.style.opacity = 1;
            var p = this.getElementsByTagName("p")[0];
            role.title = p.title;
        };
    }
    function Test(){
        var firm = document.getElementById("firm");
        var name = document.getElementById("name");
        var job = document.getElementById("job");
        var role = document.getElementById("role");
       
        if(!name.value || !job.value || !role.title || !firm.value){
            Box.autoClose("请将所有信息填写完整！");
            return false;
        }
        afterCheck({userName:name.value,companyName:firm.value,position:job.value,role:role.title});
    }
    submit.onclick = Test;
}
function afterCheck(data){
	Box.autoClose('请实现提交方法');
}

window.onload = function (){
    if(window.location.href.indexOf("SYEcheck")>0){
        SYEcheck();
        return true;
    }
    if(window.location.href.indexOf("Password")>0){
        newPasswordTest();
        return true;
    }
};
