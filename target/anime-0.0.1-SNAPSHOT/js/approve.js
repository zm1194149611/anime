window.onload = function(){
    var tutor = document.getElementById('tutor');
    var entrepreneur = document.getElementById('entrepreneur');
    var upload_tutor=document.getElementById('upload-tutor');
    var upload_entrepreneur=document.getElementById('upload-entrepreneur');
    tutor.onclick= function () {
        upload_tutor.style.display='block';
        upload_entrepreneur.style.display='none';
    };
    entrepreneur.onclick= function () {
        upload_tutor.style.display='none';
        upload_entrepreneur.style.display='block';
    };
    var input = document.getElementById("img_file");
    if (typeof FileReader === 'undefined') {
        input.setAttribute('disabled', 'disabled');
    } else {
        input.addEventListener('change', readFile, false);
    }
    fontNum("devise",18);
    fontNum("project",150);
    showImageDetail();
    addHead('head-rank','head-bottom','head-list');
    addHead('book-rank','book-bottom','book-list');
};
function fontNum(fieldId,max){
    var field =document.getElementById(fieldId);
    field.onkeyup = function(){
        if (field.value.length > max){
            field.value = field.value.substring(0, max);
        }else{
            var parent = field.parentNode;
            var label = parent.getElementsByTagName("label")[0];
            label.innerHTML = max - field.value.length;
        }
    };
}
function showInput(){
    var hint=document.getElementById('hint');
    var head_input = document.getElementById('head-input');
    hint.onclick=function(){
        head_input.style.display="block";
        hint.style.display="none";
        addHead('head-rank','head-bottom','head-list');
        addHead('book-rank','book-bottom','book-list');
    }
}
function addHead(info,up,list){
    var bottom = document.getElementById(up);
    var head_list=document.getElementById(list);
    var rank=document.getElementById(info);

    bottom.onclick=function() {
        //alert(world.value);
        if (rank.value == '' || rank.value == null) {
            alert("请输入信息！！！");
        } else {
            var div=document.createElement('div');
            var p = document.createElement('p');
            var label=document.createElement('label');
            label.innerHTML="&#10005";
            p.innerHTML = rank.value;
            rank.value="";
            head_list.appendChild(div);
            div.appendChild(p);
            div.appendChild(label);
            //head_input.style.display="none";
            //hint.style.display="block";
            removeHead(list);
        }
    }
}
function removeHead(list){
    var head_list=document.getElementById(list);
    var p=head_list.getElementsByTagName('div');
    for(var i=0; i< p.length; i++){
        p[i].onclick=function(){
            this.remove();
        }
    }
}