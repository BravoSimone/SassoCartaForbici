class ManageMatchesController < ApplicationController
  def generate_match
    @opponent = params[:commit]
    all_matches = User.all_matches(current_user).to_a
    all_matches.each do |match|
      if match.player_1.email == @opponent || match.player_2.email == @opponent
        @title = "Il giocatore è stato gia sfidato"
        @match = match
      end
    end
    if @match == nil
      new_match = { :player_1_id => current_user.id, :player_2_id => current_user.get_user_by_email(@opponent).to_a.first[:id],
                    :p1_win => 0, :p2_win => 0}
      @match = Match.create(new_match)
      @title = "La partita è stata creata"
    end
  end
end
