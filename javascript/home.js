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

$(document).ready(function(){
    $(".defaultAvatar").html("<img src=/".."");
});