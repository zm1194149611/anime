window.onload= function () {
    fontNum("question",100);
};
function fontNum(fieldId,max) {
    var field = document.getElementById(fieldId);
    field.onkeyup = function () {
        if (field.value.length > max) {
            field.value = field.value.substring(0, max);
        } else {
            var parent = field.parentNode;
            var label = parent.getElementsByTagName("label")[0];
            label.innerHTML = max - field.value.length;
        }
    }
}