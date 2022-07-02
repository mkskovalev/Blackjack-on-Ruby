# frozen_string_literal: true

class Dealer < User
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end
end
