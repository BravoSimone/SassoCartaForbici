# This class contains the dictionary to see signs weaknesses, you can add a weakness
# just typing a new sign into the universal_dictionary hash

class Game
  attr_accessor :universal_dictionary
  attr_accessor :winner
  def initialize
    @universal_dictionary = {'sasso' => ['carta', 'spock'],
                            'carta' => ['forbici', 'lucertola'],
                            'forbici' => ['sasso', 'spock'],
                            'lucertola' => ['sasso', 'forbici'],
                            'spock' => ['lucertola', 'carta']}
  end
  
  # This method returns back the universal_dictionary
  def universal_dictionary
    @universal_dictionary
  end
  
  # This method can compare 2 signs and see if a player wins
  # or if is a tie game
  def compare (player1, player2)
    if player1 == player2
      @winner = "Parità"
    else
      player1_weaknesses = universal_dictionary[player1]
      player1_weaknesses.each do |weakness|
        if weakness == player2
          @winner = "#{player2} batte #{player1} il giocatore 1 vince"
        else
          @winner = "#{player1} batte #{player2} il giocatore 2 vince"
        end
      end
    end
    @winner
  end
end