class GameCountController< ApplicationController
  def display
    @matches = current_user.all_matches(current_user.id).to_a
  end
  
  def challange_players
    @players = User.all.to_a
  end
end