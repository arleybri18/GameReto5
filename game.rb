require_relative 'definitions'
# Create class game
class Game
  # accesor atributes
  attr_reader :user, :score, :file
  #   include module
  include Definitions

  #   constructor class Game
  def initialize(user, file)
    @user = user
    @file = file
    @score = 0
  end

  # method for change the score
  def ChangeScore
    @score += 10
  end
end
