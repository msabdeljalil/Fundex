$(document).ready(function() {

  $('#user_answer').on('submit', function(event){
    event.preventDefault();
    console.log(event)

    $.post("/decks/<%= @card.deck.id %>/cards/<%= @card.id %>")
  }); // SUBMIT catcher



}); // Document Ready
