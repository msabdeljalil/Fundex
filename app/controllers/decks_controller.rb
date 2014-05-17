before '/decks/*' do
  unless session[:user_id]
    @errors = "You need to be logged in to view that!"
    request.path_info = '/sessions/new'
  end
end

get '/decks' do
  erb :"decks/list"
end

get '/decks/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  erb :"decks/view_deck"
end

get '/decks/:deck_id/cards/:card_id' do
  @round = Round.create(deck_id: params[:deck_id], user_id: session[:user_id])
  session[:round_id] = @round.id
  @card = Card.find(params[:card_id])
  erb :gameplay
end

post '/decks/:deck_id/cards/:card_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @card = Card.find_by_id(params[:card_id])
  @round = Round.find_by_id(session[:round_id])
  check_answer(params[:answer],  @card)
  if deck_complete?(params[:card_id], @deck)
    @correct_answers = @round.guesses.where(correctness: 1).count
    @total_guesses = @round.guesses.count
    @percent_score = @correct_answers.to_f / @total_guesses.to_f * 100
    erb :"users/result"
  else
    @card = advance_card(params[:card_id])
    erb :gameplay
  end
end


# Iterate over round's guesses
# where correctness == 1, incrememnet counter
# @round = Round.find_by_id(session[:round_id])
# @round.guesses.each do |guess|

#   if guess.correctness == 1


# @correct_answers = @round.guesses.where(correctness: 1).count
# @total_questions = @round.guesses.count
# @percent_score = @correct_answers / @total_questions

