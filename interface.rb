require './user'
require './player'
require './dealer'
require './deck'

class Interface
  def run
    puts "Введите ваше имя:"
    name = gets.chomp.to_s

    @player = Player.new(name)
    @dealer = Dealer.new
    @deck = Deck.new

    start_game(name)
    show_score

  end

  def start_game(name)
    2.times do
     add_card(@player)
     add_card(@dealer)
    end

  end

  def add_card(user)
    @key = @deck.all.keys.sample
    user.add_card(@key, @deck.all[@key])
    @deck.remove_card(@key)
  end

  def show_score
    puts "Карты игрока #{@player.name}:"
    @player.cards.each { |key, value| puts "#{key} - #{value}" }
    puts "очки: #{@player.score}"
    puts "Карты дилера:"
    @dealer.cards.each do |key, value|
      puts "* - *"
    end
  end

  def player_move
    case @player.score
    when

  end
end

