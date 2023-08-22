def card_generator()
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
  card_generator()
  deck = []
  card_generator().each do |key, value|
    deck << value
  end
  puts deck.flatten.shuffle
end

deck_suffler()
