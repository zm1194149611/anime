var num=0;
var limit=0;


function choose(className,number,limit,selected,arry) {
    limit=limit;
    for(var i=0;i<number;i++) {
        arry[i]=0;
    }
    var business = document.getElementsByClassName(className)[0];
    var lis = business.getElementsByTagName('li');
    for (var i = 0; i < lis.length; i++) {
        lis[i].setAttribute("id", i);
        lis[i].onclick = function () {
            if (arry[this.getAttribute("id")] == 0) {
                if (num < limit) {
                    var right1 = this.getElementsByClassName('right')[0];
                    right1.style.visibility = "visible";
                    arry[this.getAttribute("id")] = 1;
                    num++;
                } else {
                    Box.alert('您最多只能选择'+limit+"项！")
                }
            } else {
                var right2 = this.getElementsByClassName('right')[0];
                right2.style.visibility = "hidden";
                arry[this.getAttribute("id")] = 0;
                num--;
            }
        }
    }
    
    for(i=0;i<selected.length;i++)
    {
    	if(selected[i]!="")
    	{
    	  var right1=lis[selected[i]-1].getElementsByClassName('right')[0];
    	  right1.style.visibility = "visible";
    	  arry[lis[selected[i]-1].getAttribute("id")] = 1;
    	  num++;
    	}
    }
    return arry ;
}