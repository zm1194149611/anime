/**
 * Created by Tantake on 2015/12/9.
 */
function checkForm2()
{
    var input1=document.getElementById("phone").value;
    var input2=document.getElementById("picture").value;
    var input3=document.getElementById("pwd").value;
    if(input1=="" && input2=="" && input3==""){
        alert("请输入手机号、验证码、密码！！");
    }else{
        if(input1==""){
            alert("请输入手机号！！");
            return false;
        }else if(!/^(134|135|136|137|138|139|147|150|151|152|157|158|159|182|183|184|187|188|130|131|132|145|155|156|185|186|133|153|180|181|189)\d{8}$/.test(input1.toString())){
            alert("手机号码不正确！！");
            document.getElementById("phone").select();
            return false;
        }
        if(input2==""){
            alert("请输入验证码！！");
            document.getElementById("picture").select();
            return false;
        }
        if(input3==""){
             alert("请输入密码！！");
            document.getElementById("pwd").select();
            return false;
        }else if((input3.toString()).length<6){
            alert("请输入至少六位密码！！");
            document.getElementById("pwd").select();
            return false;
        }else{
            alert("提交成功！！！");
            return true;
        }
    }
}