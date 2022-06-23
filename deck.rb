class Deck
  attr_reader :all

  def initialize
    @all = {}

    nominal = {
      "A" => 11,
      "K" => 10,
      "Q" => 10,
      "J" => 10,
      "10" => 10,
      "9" => 9,
      "8" => 8,
      "7" => 7,
      "6" => 6,
      "5" => 5,
      "4" => 4,
      "3" => 3,
      "2" => 2
    }

    suits = ["+", "<3", "^", "<>"]

    nominal.each do |key, value|
      suits.each do |suit|
        suits.size.times { @all[key + suit] = value }
      end
    end
  end

  def remove_card(key)
    @all.delete(key)
  end

end
