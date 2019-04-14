/**
 * Created by Tantake on 2015/12/8.
 */
function checkForm()
    {
        var input1=document.getElementById("phone").value;
        var input2=document.getElementById("pwd").value;
        if(input1=="" && input2=="")
        {
            alert("请输入手机号和密码！");
            return false;
        }else{
            if(input1=="" || input1==null)
            {
                alert("手机号不能为空！！");
                document.getElementById("phone").select();
                return false;
            }
            if(input2=="" || input2==null)
            {
                alert("密码不能为空！！");
                //document.getElementById("pwd").onfocus();
                return false;
            }
            if(!/^(134|135|136|137|138|139|147|150|151|152|157|158|159|182|183|184|187|188|130|131|132|145|155|156|185|186|133|153|180|181|189)\d{8}$/.test(input1.toString()))
            {
                alert("手机号码不正确！！");
                document.getElementById("phone").select();
                return false;
            }
        }

    }