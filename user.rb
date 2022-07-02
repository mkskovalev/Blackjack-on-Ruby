# frozen_string_literal: true

class User
  attr_reader :money, :cards

  def initialize
    @money = 100
    @cards = []
  end

  def make_bet(sum)
    @money -= sum
    sum
  end

  def add_money(sum)
    @money += sum
  end

  def add_card(card)
    @cards << card
  end

  def delete_cards
    @cards = []
  end

  def score
    sum = 0
    @cards.each { |card| sum += card.value }
    ace? && sum > 21 ? sum - 10 : sum
  end

  def ace?
    !!@cards.detect { |card| card.face == 'A' }
  end
end
