class User
  attr_reader :name, :money, :cards

  def initialize(name)
    @name = name
    @money = 100
    @cards = {}
  end

  def give_money(sum)
    @money -= sum
  end

  def add_money(sum)
    @money += sum
  end

  def add_cards(key, value)
    @cards.merge(cards)
  end

  def delete_cards
    @cards = {}
  end
end
