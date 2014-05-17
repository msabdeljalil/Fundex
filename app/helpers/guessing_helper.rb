helpers do

  def add_guess(card, answer, correctness, round_id)
    card.guesses << Guess.create(
      user_input: answer,
      correctness: correctness,
      round_id: round_id
      )
  end

  def advance_card(card_id)
    Card.find(card_id.to_i + 1)
  end

  def deck_complete?(card_id, deck)
    (card_id.to_i >= deck.cards.length) ? true : false
  end

  def check_answer(user_answer, card)
    if user_answer == card.answer
      add_guess(card, user_answer, 1, session[:round_id])
    else
      add_guess(card, user_answer, 0, session[:round_id])
    end
  end

end
