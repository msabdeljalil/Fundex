$(document).ready(function() {

  $('#user_submit').submit(function(event){
    var user_answer, url;
    event.preventDefault();
    $("#submit").hide();
    user_answer = $("#user_answer").serialize();
    console.log(user_answer);
     //  Grabbing the url
    url = $("#user_submit").attr('action');


    $.post(url, user_answer, function(data){
      $("p").css( "border", "9px solid red" );
      $("p").text()
    }); // POST request

  }); // SUBMIT catcher
}); // Document Ready

