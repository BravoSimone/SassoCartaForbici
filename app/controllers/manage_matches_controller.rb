class ManageMatchesController < ApplicationController
  def generate_match
    @opponent = params[:player_id].to_i
    all_matches = User.all_matches(current_user.id).to_a
    all_matches.each do |match|
      if (match.player_1_id.to_i == @opponent || match.player_2_id.to_i == @opponent)&&(match.request_close.nil? && match.accept_close.nil?)
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
  
  def close_match
    @close = params[:close]
    @match = Match.find(params[:match_id].to_i)
    @choice = params[:choice].to_i
    
    
    p "____________________"
    p @choice
    p "Sono qui"
    p @match
    p "____________________"
    
    if @choice == 0
      p "____________________"
      p "Il match rimane aperto"
      p "____________________"
      @match.request_close = nil
      @match.accept_close = nil
      @match.save
    elsif @choice == 1
      p "____________________"
      p "Chiudo il match"
      p "____________________"
      @match.request_close = 1
      @match.accept_close = 1
      @match.save
    end
    if @close
      if current_user.id == @match.player_1_id
        @match.request_close = 1
        @match.save
      elsif current_user.id == @match.player_2_id
        @match.accept_close = 1
        @match.save
      end
    end
  end
end
