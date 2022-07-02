class Player < User
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end
end
