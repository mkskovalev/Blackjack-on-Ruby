class Deck

  def initialize
    @faces = [(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['+', '<3', '^', '<>']
    @cards = []

    @faces.each do |face|
      if face.class == Integer
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
