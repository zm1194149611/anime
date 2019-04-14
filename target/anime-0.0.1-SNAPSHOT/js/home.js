var fa=0;
var val=1;
var time=1;
var time1 = 0;
var itmes = ['chuandong','chuannan','chuanbei','chuanxi','chengdu'];
var timer1=null;
var timer2=null;
var myTimer=null;
var areas = ['阿坝','甘孜','成都','德阳','绵阳','眉山','资阳','南充','遂宁','达州','广元','巴中','广安','攀枝花','凉山','雅安','自贡','宜宾','泸州','内江','乐山'];
var length=areas.length-1;
var num=2;
window.onload= function() {
    changeCity();
    area(areas);
    footer.footerAddHome();
    var tutor=document.getElementById('tutor');
	var project=document.getElementById('project');
    var map=document.getElementById('map');
    var chengdu=document.getElementById('chengdu');
    var chuandong=document.getElementById('chuandong');
    var chuanxi=document.getElementById('chuanxi');
    var chuannan=document.getElementById('chuannan');
    var chuanbei=document.getElementById('chuanbei');
    var chooseArea=document.getElementById('chooseArea');
    
    var areaPhone="";
    $.ajax({
		url:'areaPhone',
		type:'post',
		dataType:'json',
		data:{
			cityName:'四川'
		},
		success:function(data){
			areaPhone=data.areaPhone;
		},
		error:function(data){
			Box.autoClose('提交失败，请检查网络');
		}
	});
    
    var phone = document.getElementById('phone');
    phone.onclick = function(){
    	Box.alert("请拨打SYE办公室电话"+areaPhone,function(){
    		location.href='tel:'+areaPhone;
    	});
    };
    
    tutor.onclick = function(){
		 window.open(contextPath+"/user/tutorList","_self");  
	 };
    project.onclick = function(){
	    location.href=contextPath+"/ground/projectList";
	 };
    map.onclick= function () {
        clearInterval(timer1);
        clearInterval(timer2);
    };
    chengdu.onclick=function(){
    	clearInterval(myTimer);
    	time=1;
        changeMy('chengdu');
    	chooseArea.style.backgroundColor="#ef6ffa";
        this.style.opacity=1;
        chuandong.style.opacity=1;
        chuannan.style.opacity=1;
        chuanxi.style.opacity=1;
        chuanbei.style.opacity=1;      
        num=2;
        area(areas);
        //  alert("Welcome to Chengdu")
    };
    chuandong.onclick=function(){
    	chooseArea.style.backgroundColor="#ec412c";
        this.style.opacity=1;
        chengdu.style.opacity=1;
        chuannan.style.opacity=1;
        chuanxi.style.opacity=1;
        chuanbei.style.opacity=1;
        clearInterval(myTimer);
        time=1;
        changeMy('chuandong');
        num=7;
        area(areas);
    };
    chuannan.onclick=function(){
    	chooseArea.style.backgroundColor="#3e82f7";
        this.style.opacity=1;
        chuandong.style.opacity=1;
        chengdu.style.opacity=1;
        chuanxi.style.opacity=1;
        chuanbei.style.opacity=1;
        clearInterval(myTimer);
        time=1;
        changeMy('chuannan');
        num=16;
        area(areas);
    };
    chuanxi.onclick=function(){
    	chooseArea.style.backgroundColor="#fdbe00";   	
        this.style.opacity=1;
        chuandong.style.opacity=1;
        chuannan.style.opacity=1;
        chengdu.style.opacity=1;
        chuanbei.style.opacity=1;
        clearInterval(myTimer);
        time=1;
        changeMy('chuanxi');
        num=1;
        area(areas);
    };
    chuanbei.onclick=function(){
    	chooseArea.style.backgroundColor="#2ca94f";
        this.style.opacity=1;
        chuandong.style.opacity=1;
        chuannan.style.opacity=1;
        chuanxi.style.opacity=1;
        chengdu.style.opacity=1;
        clearInterval(myTimer);
        time=1;
        changeMy('chuanbei');
        num=13;
        area(areas);
    };
    chooseArea.onclick=function(){
    	var  choose=document.getElementById('choose');
    	var area=choose.innerHTML;
    	window.open(contextPath+'/ground/areaHome?areaName='+area,'_self');
    };
};
function changeCity(){
	time1=Math.floor(Math.random()*5)
    var obj = itmes[time1];
    changeArea(obj);
    timer1=setTimeout("changeCity()",1500);
}

function changeArea(obj){
    var thing=document.getElementById(obj);
    if(fa==0){
        thing.style.opacity=val;
        val-=0.02;
        if(val<=0.3){
            fa=1;
        }
    }else{
        thing.style.opacity=val;
        val+=0.02;
        if(val==1){
            fa=0;
        }
    }
    time+=1;
    if(time<140){
        timer2=setTimeout("changeArea('"+obj+"')",5);
    }else{
        time=0;
    }
}
function changeMy(obj){
    var thing=document.getElementById(obj);
    if(fa==0){
        thing.style.opacity=val;
        val-=0.02;
        if(val<=0){
            fa=1;
        }
    }else{
        thing.style.opacity=val;
        val+=0.02;
        if(val==1){
            fa=0;
        }
    }
    if(time<10){
        myTimer=setTimeout("changeMy('"+obj+"')",5);
    }else{
        time=0;
    }
}
function area(a){
    var turnLeft=document.getElementById('turnLeft');
    var turnRight=document.getElementById('turnRight');
    var left=document.getElementById('left');
    var right=document.getElementById('right');
    var choose=document.getElementById('choose');

    left.innerHTML=a[num-1];
    choose.innerHTML=a[num];
    right.innerHTML=a[num+1];
    turnRight.onclick= function () {
        if(num==length+1)
        {
            num=1;
        }
        else if (num ==length)
            num--;
        else
            num++;
        if(num-1<0)
        {
            left.innerHTML=a[length];
        }
        else
            left.innerHTML = a[num - 1];
        choose.innerHTML = a[num];
        if(length==num)
        {
            num=-1;
        }
        right.innerHTML = a[num + 1];

    };
    turnLeft.onclick= function () {

        if(num==-1)
        {
            right.innerHTML = a[0];
            num=length;
        }
        else if(num==0)
        {
            right.innerHTML=a[num];
            num++;
        }
        else {
            num--;
            if (num >= length) {
                right.innerHTML = a[0];
            }
            else {
                right.innerHTML = a[num + 1];
            }
        }
        choose.innerHTML=a[num];
        if(num<=0) {
            num = length+1;
            left.innerHTML=a[length];
        }
        else
            left.innerHTML=a[num-1];
    }
}