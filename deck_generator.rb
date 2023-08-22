def deck_generator()
  # cards = (0..9).to_a + (1..9).to_a + (10..17).to_a
  cards_blue = (0..9).to_a.map {|chiffre| "#{chiffre}#{"b"}"} + (1..9).to_a.map {|chiffre| "#{chiffre}#{"b"}"}
  cards_green = (0..9).to_a.map {|chiffre| "#{chiffre}#{"g"}"} + (1..9).to_a.map {|chiffre| "#{chiffre}#{"g"}"}
  cards_red = (0..9).to_a.map {|chiffre| "#{chiffre}#{"r"}"} + (1..9).to_a.map {|chiffre| "#{chiffre}#{"r"}"}
  cards_yellow = (0..9).to_a.map {|chiffre| "#{chiffre}#{"y"}"} + (1..9).to_a.map {|chiffre| "#{chiffre}#{"y"}"}

  card_set = {
    blue: cards_blue,
    green: cards_green,
    red: cards_red,
    yellow: cards_yellow,
    specials: (18..25).to_a
  }
  # puts card_set
end

def deck_suffler()
  deck = []
  deck_generator().each do |key, value|
    deck << value
  end
  deck = deck.flatten.shuffle
end

#  deck_suffler()


def init_draw(number_of_cards)
  deck = deck_suffler()
  puts "deck originel" + deck.to_s
  player1 = []
  player2 = []
  played_card = []
  number_of_cards.times do
    card = deck.shift
    player1 << card

    card = deck.shift
    player2 << card
  end

  played_card << deck.shift

  puts "main1=" + player1.to_s
  puts "main2=" + player2.to_s
  puts "stack=" + played_card.to_s
  puts "nouveau deck"+  deck.to_s
end

def draw()
  
end

init_draw(7)
