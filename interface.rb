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
     add_card
     @player.add_card(@key, @deck.all[@key])
     @deck.remove_card(@key)
     add_card
     @dealer.add_card(@key, @deck.all[@key])
     @deck.remove_card(@key)
    end
  end

  def add_card
    @key = @deck.all.keys.sample
  end

  def show_score
    puts "#{@player.name}:\n #{@player.cards.each { |key, value| puts "#{key} - #{value}"} }\nочки: #{@player.cards.values.sum}"
    puts "Dealer:\n #{@dealer.cards.each { |key, value| puts "#{key} - #{value}"}}\nочки: #{@dealer.cards.values.sum}"
  end
end
