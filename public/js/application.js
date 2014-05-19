
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
                $("p").css( "border", "9px solid red" );
                // data = $.parseJSON(serverResponse);
                $("#gameplay").replaceWith(serverResponse)
            },
        })
    }); // SUBMIT catcher
}); // Document Ready

