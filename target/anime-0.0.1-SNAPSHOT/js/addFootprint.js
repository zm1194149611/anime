/**
 * Created by Tantake on 2016/3/30.
 */
window.onload= function () {
    timeStart();
    fontNum("devise",150);
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
function timeStart() {
    MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    //先给年下拉框赋内容
    var y = new Date().getFullYear();
    for (var i = (y - 30); i < (y + 30); i++) {
        document.time.year.options.add(new Option(" " + i, i));
    }
    for (var i = 1; i < 13; i++) {
        document.time.month.options.add(new Option(" " + i, i));
    }
    document.time.year.value = y;
    document.time.month.value = new Date().getMonth() + 1;
    var n = MonHead[new Date().getMonth()];
    if (new Date().getMonth() == 1 && IsPinYear(YYYYvalue)){
        n++;
    }
    writeDay(n);
    document.time.day.value = new Date().getDate();

}
function changeYear(str){
    var month=document.time.month.options[document.time.month.selectedIndex].value;
    if(month==""){
        var e=document.time.day;
        optionsClear(e);
        return;
    }
    var n=MonHead[month-1];
    if(month==2 && IsPinYear(str)){
        n++;
        writeDay(n);
    }
}
function changeMonth(str){
    var year=document.time.year.options[document.time.year.selectedIndex].value;
    if(year==""){
        var e=document.time.day;
        optionsClear(e);
        return;
    }
    var n=MonHead[str-1];
    if(str==2 && IsPinYear(year)){
        n++;
        writeDay(n);
    }
}
function writeDay(n){
    var e=document.time.day;
    optionsClear(e);
    for(var i=1;i<(n+1);i++){
        e.options.add(new Option(" "+i,i));
    }
}
function IsPinYear(year){
    return(0==year%4 && (year%100!=0 || year%400==0));
}
function optionsClear(e){
    e.options.length=1;
}