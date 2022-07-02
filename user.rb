class User
  attr_reader :money, :cards

  def initialize
    @money = 100
    @cards = []
  end

  def give_money(sum)
    @money -= sum
  end

  def add_money(sum)
    @money += sum
  end

  def add_cards(card)
    @cards << card
  end

  def delete_cards
    @cards = []
  end

  def score
  end
end
