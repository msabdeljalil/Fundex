before '/decks/*' do
  unless session[:user_id]
    @errors = "You need to be logged in to view that!"
    request.path_info = '/sessions/new'
  end
end

get '/decks' do
  erb :"decks/list"
end

get '/rounds' do
  "Well, rounds are a little difficult to write now.."
end

get '/decks/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  erb :"decks/view_deck"
end

get '/decks/:deck_id/cards/:card_id' do
  @card = Card.find(params[:card_id])
  erb :gameplay
end

post '/decks/:deck_id/cards/:card_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @card = Card.find_by_id(params[:card_id])

  if params[:answer] == @card.answer
    @card.guesses << Guess.create(
      user_input: params[:answer],
      correctness: 1,
      round_id: 1 #session[:round_id]
      )
  else
    @card.guesses << Guess.create(
      user_input: params[:answer],
      correctness: 0,
      round_id: 1 #session[:round_id]
      )
  end

  if params[:card_id].to_i >= @deck.cards.length
    redirect '/rounds/session[:round_id]'
  else
    @card = Card.find(params[:card_id].to_i + 1)
    erb :gameplay
  # redirect "/decks/#{params[:deck_id]}/cards/#{params[:card_id].to_i+1}"
  end
end

