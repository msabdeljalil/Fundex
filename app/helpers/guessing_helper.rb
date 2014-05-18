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
    if user_answer.downcase == card.answer.downcase
      add_guess(card, user_answer, true, session[:round_id])
    else
      add_guess(card, user_answer, false, session[:round_id])
    end
  end

  def calculate_results(round)
    @correct_answers = round.guesses.where(correctness: true).count
    @total_guesses = round.guesses.count
    @percent_score = @correct_answers.to_f / @total_guesses.to_f * 100
    return @correct_answers, @total_guesses, @percent_score
  end

  def clear_round()
    session.delete(:round_id)
  end

  def find_deck_card_round(deck_id, card_id)
    @deck = Deck.find_by_id(deck_id)
    @card = Card.find_by_id(card_id)
    @round = Round.find_by_id(session[:round_id])
    return @deck, @card, @round
  end

  def print_correctness(card)
    card.guesses.last.correctness == true ? @previous_answer = "correct!" : @previous_answer = "WRONG!"
    return @previous_answer
  end

  def pctg(round)
    pctg = round.guesses.where(correctness: 1).count.to_f / round.guesses.count.to_f * 100
    if pctg > 0
      @percentage = pctg
    else
      @percentage = 0
    end
  end

end
