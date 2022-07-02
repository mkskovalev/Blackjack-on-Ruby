require './card'

class Deck
  attr_reader :cards

  def initialize
    @faces = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    @suits = ['+', '<3', '^', '<>']
    @cards = []
    new_deck
  end

  def new_deck
    @faces.each do |face|
      if face.instance_of?(Integer)
        value = face
      elsif face == 'A'
        value = 11
      else
        value = 10
      end
      @suits.each { |suit| @cards << Card.new(face, suit, value) }
    end
    @cards.shuffle!
  end

  def delete_card(card)
    @cards.delete(card)
  end
end
