latin = Deck.create(name: Faker::Lorem.word)
10.times { Card.create( question: Faker::Lorem.word, answer: Faker::Lorem.word, deck_id: latin.id)}
titles = Deck.create(name: Faker::Name.title)
10.times { Card.create( question: Faker::Name.title, answer: Faker::Name.title, deck_id: titles.id)}
countries = Deck.create(name: Faker::Address.country)
10.times { Card.create( question: Faker::Address.country, answer: Faker::Address.country, deck_id: countries.id)}
bs = Deck.create(name: Faker::Company.bs)
10.times { Card.create( question: Faker::Company.bs, answer: Faker::Company.bs, deck_id: bs.id)}

