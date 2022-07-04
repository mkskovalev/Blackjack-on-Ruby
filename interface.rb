# frozen_string_literal: true

require './user'
require './deck'

class Interface

  MAX_POINT = 21
  MAX_CARDS = 3
  DEALER_MAX_SCORE = 17

  def run
    puts 'Введите ваше имя:'
    name = gets.chomp.to_s

    @player = User.new(name)
    @dealer = User.new('Dealer')

    loop do
      break if no_money?

      @deck = Deck.new
      @bank = 0

      2.times { add_card(@player) }
      2.times { add_card(@dealer) }

      @bank += @player.make_bet(10)
      @bank += @dealer.make_bet(10)

      round

      results

      puts 'Хотите сыграть еще раз?'
      puts '1 - Да'
      puts '2 - Нет'

      input = gets.chomp.to_i

      exit if input == 2
    end
  end

  def round
    count = 1

    loop do
      break if count == 2

      puts "Карты игорка #{@player.name}:"
      @player.cards.each { |card| print "#{card.face}#{card.suit}," }
      puts " Очки - #{@player.score}"
      puts "Карты игрока #{@dealer.name}:"
      @dealer.cards.each { |_card| print '**,' }
      puts " Очки - **"
      puts "\nВыберите действие и введите номер:"
      puts '1 - Взять карту'
      puts '2 - Пропустить ход'
      puts '3 - Открыть карты'

      action = gets.chomp.to_i

      case action
      when 1
        add_card(@player)
        break if @player.score > MAX_POINT

        dealer_turn

        break if @player.cards.count == MAX_CARDS

      when 2
        dealer_turn
        count += 1
      else
        dealer_turn
        break
      end
    end
  end

  def results
    puts "Карты игорка #{@player.name}:"
    @player.cards.each { |card| print "#{card.face}#{card.suit}," }
    puts " Очки - #{@player.score}"
    puts "Карты игрока #{@dealer.name}:"
    @dealer.cards.each { |card| print "#{card.face}#{card.suit}," }
    puts " Очки - #{@dealer.score}"

    if (@player.score == @dealer.score) || (@player.score > MAX_POINT && @dealer.score > MAX_POINT)
      @player.add_money(@bank / 2)
      @dealer.add_money(@bank / 2)
      puts 'Ничья! Банк поделен поровну.'
    elsif @dealer.score > MAX_POINT && @player.score < MAX_POINT
      @player.add_money(@bank)
      puts "Победил игрок #{@player.name}!"
    elsif @player.score > MAX_POINT && @dealer.score < MAX_POINT
      @dealer.add_money(@bank)
      puts "Победил #{@dealer.name}!"
    elsif @player.score > @dealer.score
      @player.add_money(@bank)
      puts "Победил игрок #{@player.name}!"
    else
      @dealer.add_money(@bank)
      puts "Победил #{@dealer.name}!"
    end

    @player.delete_cards
    @dealer.delete_cards

    puts "Банк игрока #{@player.name}: $#{@player.money}"
    puts "Банк дилера: $#{@dealer.money}"
  end

  def dealer_turn
    if @dealer.score >= DEALER_MAX_SCORE
      puts "#{@dealer.name} пропускает ход."
      return
    end

    return if @dealer.cards.count == MAX_CARDS

    add_card(@dealer)
    puts "#{@dealer.name} взял карту."
  end

  def add_card(user)
    user.add_card(@deck.cards[0])
    @deck.cards.delete_at(0)
  end

  def no_money?
    @player.money.zero? || @dealer.money.zero?
  end
end
