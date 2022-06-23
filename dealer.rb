class Dealer
  attr_reader :money, :cards

  def initialize
    @money = 100
    @cards = {}
  end

  def give_money(sum)
    @money -= sum
  end

  def add_money(sum)
    @money += sum
  end

  def add_card(key, value)
    @cards[key] = value
  end

  def delete_cards
    @cards = {}
  end
end
