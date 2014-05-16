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
