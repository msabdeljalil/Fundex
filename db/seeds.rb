latin =     Deck.create(name: "latin")
titles =    Deck.create(name: "titles")
countries = Deck.create(name: "countries")
10.times { Card.create( question: Faker::Address.country, answer: Faker::Address.country, deck_id: 1)}


10.times { Card.create( question: Faker::Lorem.word, answer: Faker::Lorem.word, deck_id: 6)}
10.times { Card.create( question: Faker::Name.title, answer: Faker::Name.title, deck_id: titles.id)}
10.times { Card.create( question: Faker::Company.bs, answer: Faker::Company.bs, deck_id: bs.id)}

User.all.each { |user| user.decks.push(bs, latin, countries, titles)}

the_card = Card.create( question: Faker::Lorem.word, answer: Faker::Lorem.word, deck_id: 6)
the_card.guesses << Guess.create(
  user_input: Faker::Lorem.word,
  correctness: rand(2),
  round_id: rand(User.first.rounds.length),
  card_id: the_card.id
)

User.first.rounds.first.cards << Card.create( question: Faker::Lorem.word, answer: Faker::Lorem.word, deck_id: 6)
