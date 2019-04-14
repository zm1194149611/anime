/**
 * Created by Administrator on 2015/12/7 0007.
 */
var userModifyUtil={
		fields:{
			sexBox:'',
			jueBox:'',
			layerForm:'',
			sexForm:'',
			jueForm:'',
			sex:'',
			jue:'',
			genderInput:'',
			roleInput:''
		},
		init:function(){
			userModifyUtil.fields.sexBox = document.getElementById("sexBox");
			userModifyUtil.fields.jueBox = document.getElementById("jueBox");
		  //  userModifyUtil.fields.layerForm = document.getElementsByClassName("layerForm")[0];
		    userModifyUtil.fields.sexForm = document.getElementById("sexForm");
		    userModifyUtil.fields.jueForm = document.getElementById("jueForm");
		    userModifyUtil.fields.sex = document.getElementById("sex");
		    userModifyUtil.fields.jue = document.getElementById("jue");
		    userModifyUtil.fields.genderInput = document.getElementById("gender");
		    userModifyUtil.fields.roleInput = document.getElementById("role");
		    userModifyUtil.fields.sexBox.onclick=userModifyUtil.sexBoxClick;
		    //userModifyUtil.fields.jueBox.onclick=userModifyUtil.roleBoxClick;
		},
		sexBoxClick:function(){
		//	userModifyUtil.fields.layerForm.style.display = "block";
		//	userModifyUtil.fields.jueForm.style.display = "none";
	     //   userModifyUtil.fields.sexForm.style.display = "block";
			 var layerForm = document.getElementsByClassName("layerForm")[0];
			 layerForm.style.display = "block";
	        var ps = userModifyUtil.fields.sexForm.getElementsByTagName("p");
	        for(var i=0;i<ps.length;i++){
	            ps[i].onclick = function(){
	                var value = this.innerHTML;
	                userModifyUtil.fields.sex.innerHTML = value;
	                userModifyUtil.fields.genderInput.value = this.title;
	                userModifyUtil.fields.layerForm.style.display = "none";
	                userModifyUtil.genderSave(this.title);
	            };
	        }
		},
		genderSave:function(value){
			Box.autoClose("触发保存性别，但未实现");
		},
		roleBoxClick:function(){
			userModifyUtil.fields.layerForm.style.display = "block";
			userModifyUtil.fields.sexForm.style.display = "none";
			userModifyUtil.fields.jueForm.style.display = "block";

	        var ps = userModifyUtil.fields.jueForm.getElementsByTagName("p");
	        for(var i=0;i<ps.length;i++){
	            ps[i].onclick = function(){
	                var value = this.innerHTML;
	                userModifyUtil.fields.jue.innerHTML = value;
	                userModifyUtil.fields.roleInput = this.title;
	                userModifyUtil.fields.layerForm.style.display = "none";
	                userModifyUtil.roleSave(this.title);
	            };
	        }
		},
		roleSave:function(value){
			Box.autoClose("触发保存角色，但未实现");
		}
};
