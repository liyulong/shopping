function get_package(commodity_id) {
    var check_value = new RegExp(/[^0-9]/g);
    var number = $("number"+commodity_id).value
    var n = $("amount"+commodity_id).value
    if (check_value.test(number)){
        alert ("请输入正确的商品数量！")
        return false;
    }
    if (parseInt(n)<parseInt(number)){
        alert ("商品库存不足，请重新输入购买数量！");
        return false;
    }
    if (number==0) {
       alert("请输入购买数量！");
       return false;
    }

    window.location.href = "/suppliers/"+ commodity_id +"/package?number=" + number;
}

function checkone(){
    var sles=document.getElementsByName("check_b");
    var checked_ids = new Array();
    for (var i=0;i<sles.length;i++) {
        if (sles[i].checked) {
            checked_ids.push(sles[i].value+';'+$("number"+sles[i].value).value );
        }
    }

    document.getElementById("commodity_id").value = checked_ids;
}
function sltall(checkstatus){
    var d=document.getElementsByName("check_b");
    var checked_ids = new Array();
    for(var i=0; i<d.length; i++){
        if (d[i].disabled == false) {
            d[i].checked=checkstatus;
            checked_ids.push(d[i].value+';'+$("number"+d[i].value).value );
        }
    }
    document.getElementById("commodity_id").value = checked_ids;
}
function check(commodity_id){
    var commodity_ids=$("commodity_id").value;
    var n=commodity_ids.split(",");
    for(i=0;i<=n.length-1;i++) {
        if (parseInt($("commodity_value"+n[i].split(";")[0]).innerHTML)<parseInt(n[i].split(";")[1])){
            alert ("库存不足，请重新输入购买数量");
            //        document.getElementById("emailErr").innerHTML="<font color = 'red'>库存不足，请重新输入购买数量</font>";
            return false;
        }
    }
}