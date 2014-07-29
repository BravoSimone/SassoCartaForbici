class GameCountController< ApplicationController
  def display
    @matches = User.all_matches(current_user.id).to_a
  end
  
  def challange_players
    @players = User.all.to_a
  end
end