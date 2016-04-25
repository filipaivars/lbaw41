/**
 * Created by filipaivars on 23/04/16.
 */


$(document).ready(function(){
    flag=false;
    $(".btn2").click(function(){
        if(!flag) {
            $(".aparece").slideDown();
            flag=true;
        }
        else {
            $(".aparece").slideUp();
            flag = false;
        }
    });
});

$(function(){
    $("#includeHome").load("views/home.html");
});

function myFunction() {
    var x = document.getElementsByClassName("avatar");
    var i;
    for (i in x) {
        x[i].src = "../../images/assets/default.png";
    }

}

function roundMe(num) {
    var n = num.toFixed(1);
    return n;
}

function checkNull(num) {
    if(num==null)
        return 0;
    else
        return num;
}
