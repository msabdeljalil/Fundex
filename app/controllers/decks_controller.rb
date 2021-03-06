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
  find_deck_card_round(params[:deck_id], params[:card_id])
  check_answer(params[:answer], @card)
  if deck_complete?(params[:card_id], @deck)
    calculate_results(@round)
    clear_round()
    if request.xhr?
      content_type :json
      erb :"users/result".to_json
    else
      erb :"users/result"
    end
  else
    print_correctness(@card)
    @card = advance_card(params[:card_id])
    if request.xhr?
      content_type :json
      return erb(:gameplay, layout: false).to_json
      # I have no idea how the fuck to parse this shit.
      # return {:key1 => "question"}.to_json
    else
      erb :gameplay
    end
  end
end
