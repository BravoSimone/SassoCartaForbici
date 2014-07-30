class ManageMatchesController < ApplicationController
  def generate_match
    @opponent = params[:player_id].to_i
    all_matches = User.all_matches(current_user.id).to_a
    all_matches.each do |match|
      if match.player_1_id.to_i == @opponent || match.player_2_id.to_i == @opponent
        @title = "Il giocatore è stato gia sfidato"
        @match = match.id
      end
    end
    if @match.nil?
      new_match = { :player_1_id => current_user.id, :player_2_id => @opponent,
                    :p1_win => 0, :p2_win => 0}
      @match = Match.create(new_match).id
      @title = "La partita è stata creata"
    end
  end
end
