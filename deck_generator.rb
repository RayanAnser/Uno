def deck_generator()
  cards_blue = (0..9).to_a.map { |chiffre| "#{chiffre}#{"b"}" } + (1..9).to_a.map { |chiffre| "#{chiffre}#{"b"}" } + (10..15).to_a.map { |chiffre| "#{chiffre}#{"b"}" }
  cards_green = (0..9).to_a.map { |chiffre| "#{chiffre}#{"g"}" } + (1..9).to_a.map { |chiffre| "#{chiffre}#{"g"}" } + (10..15).to_a.map { |chiffre| "#{chiffre}#{"g"}" }
  cards_red = (0..9).to_a.map { |chiffre| "#{chiffre}#{"r"}" } + (1..9).to_a.map { |chiffre| "#{chiffre}#{"r"}" } + (10..15).to_a.map { |chiffre| "#{chiffre}#{"r"}" }
  cards_yellow = (0..9).to_a.map { |chiffre| "#{chiffre}#{"y"}" } + (1..9).to_a.map { |chiffre| "#{chiffre}#{"y"}" } + (10..15).to_a.map { |chiffre| "#{chiffre}#{"y"}" }

  #special ids
  #10 = +2
  #11 = +2
  #12 = inversion
  #13 = inversion
  #14 = skip
  #15 = skip
  #16 = change_color
  #17 = change_color
  #18 = change_color
  #19 = change_color
  #20 = +4
  #21 = +4
  #22 = +4
  #23 = +4

  card_set = {
    blue: cards_blue, #les id de 10 à 15 représente les cartes effet de couleur
    green: cards_green,
    red: cards_red,
    yellow: cards_yellow,
    specials: (16..23).to_a # Représente les 8 cartes, +4 et choix de couleur
  }
end

# ///////////////////////////////////////////////////////////

def deck_suffler()
  deck = []
  deck_generator().each do |key, value|
    deck << value
  end
  deck = deck.flatten.shuffle
end

#  deck_suffler()

# ///////////////////////////////////////////////////////////
def init_draw(number_of_cards)
  deck = deck_suffler()
  puts "deck originel" + deck.to_s
  player1 = [20,16]
  player2 = []
  played_cards = []
  number_of_cards.times do
    card = deck.shift
    player1 << card

    card = deck.shift
    player2 << card
  end

  played_cards << deck.shift

  puts "main1=" + player1.to_s
  puts "main2=" + player2.to_s
  puts "stack=" + played_cards.to_s
  puts "nouveau deck"+  deck.to_s

  [player1, player2, played_cards, deck]
end
# ///////////////////////////////////////////////////////////

# def draw()

# end

# ///////////////////////////////////////////////////////////



def valid_play?(card, top_card)
  color_match = card[-1] == top_card[-1]  # Vérifie si les couleurs correspondent
  number_match = card[0..-2].to_i == top_card[0..-2].to_i  # Vérifie si les numéros correspondent
  special_cards = ["16","17","18","19","20","21","22","23"].include?(card) # Laisse passer les cartes spéciales

  color_match || number_match || special_cards # La carte est valide si les couleurs ou les numéros correspondent
end

def deposit_card(player, played_cards, deck)
  puts "Choisissez une carte de votre main à déposer sur la pile (par exemple, '4r' pour 4 rouge): ou piochez avec p"
  card_choice = gets.chomp  # Demander au joueur de saisir la carte

  if card_choice == "p"
    player << deck.shift
    puts "Main player après pioche=" + player.to_s
  elsif player.map(&:to_s).include?(card_choice) && valid_play?(card_choice, played_cards.last)
    played_cards << card_choice     # Ajouter la carte à la pile
    player.delete(card_choice)     # Retirer la carte de la main du joueur
    puts "Main player après dépôt=" + player.to_s
    puts "Stack après dépôt=" + played_cards.to_s
    return card_choice
  elsif !player.map(&:to_s).include?(card_choice)
    puts "La carte choisie n'est pas dans votre main."
  else
    puts "Vous ne pouvez pas jouer cette carte."
  end
end

player1, player2, played_cards, deck = init_draw(7)  # Obtient les informations nécessaires de la fonction init_draw

def card_plus4(player, played_cards, deck)
  if played_cards == "20" || played_cards == "21" || played_cards == "22" || played_cards == "23"
    4.times do
      player << deck.shift
    end
    puts "main2=" + player.to_s
  end
end

def card_color_choice(played_cards)
  if played_cards == "16" || played_cards == "17" || played_cards == "18" || played_cards == "19"
    puts "Choississez une nouvelle couleur (b, g, r, y)"
    new_color = gets.chomp.downcase  # Demander au joueur de saisir la carte
    played_cards << new_color  # Remplacez la dernière lettre par la nouvelle couleur
    puts played_cards
  end
end


# ///////////////////////////////////////////////////////////

while player1.length > 0 || player2.length > 0
  # Logique pour le joueur 1
  puts "C'est au tour du joueur 1."
  deposited_card = deposit_card(player1, played_cards, deck) # Appelle la fonction pour déposer une carte pour le joueur 1
  card_plus4(player2, deposited_card, deck)
  card_color_choice(deposited_card)

  # Logique pour le joueur 2
  puts "C'est au tour du joueur 2."
  deposit_card(player2, played_cards, deck)
end
