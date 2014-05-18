
$(document).ready(function() {

    $('#user_submit').submit(function(event){
        var user_answer, url;
        event.preventDefault();
        $("#submit").hide();
        user_answer = $("#user_answer").serialize();
        url = $("#user_submit").attr('action');

        $.ajax({
            data: user_answer,
            type:'POST',
            url: url,
            success: function(serverResponse, status, jqXHR){
                console.log(serverResponse);
                // $("p").css( "border", "9px solid red" );
                data = jQuery.parseJSON(serverResponse);
                console.log(status);
                // $('body').append(serverResponse)
                // console.log(serverResponse)
            },
        }).always(function() {alert( "success" ); });

    }); // SUBMIT catcher
}); // Document Ready

