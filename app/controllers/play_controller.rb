class PlayController < ApplicationController
  require 'games.rb'
  # Ritornare l'elenco di tutte le azioni possibili
  def singleplayer
    @dictionary = params[:commit]
    @games = ::Game.new.universal_dictionary
    if @dictionary.to_s == "Nuova Partita"
      session[:winner] = nil
    else
      unless @dictionary.nil?
        games = Game.new
        choise = (rand * 5).to_i
        random_sign = ""
        case choise
        when 0
          random_sign = "sasso"
        when 1
          random_sign = "carta"
        when 2
          random_sign = "forbici"
        when 3
          random_sign = "lucertola"
        when 4
          random_sign = "spock"
        end
        @winner = games.compare(@dictionary, random_sign)
        session[:winner] = session[:winner].to_s + "-" + @winner
      end
    end
  end
  
  def multiplayer
    @opponent = params[:match]
    @games = ::Game.new.universal_dictionary
    
    if @opponent == current_user.email
      @player_1 = User.find_by_email(@opponent)
      @player_2 = current_user
    else
      @player_1 = current_user
      @player_2 = User.find_by_email(@opponent)
    end
    @match = Match.find_match_by_id(@player_1.id ,@player_2.id)
    @history = @match.plays.to_a
  end
  
  def game_processor
    @parameters = params[:play]
    @opponent = @parameters.tr('"\[],','').split(' ')[0]
    @sign = @parameters.tr('"\[],','').split(' ')[1]
    
    match = Match.find_match_by_id(User.find_by_email(@opponent).id , current_user.id )
    
    play = match.plays.last
    
    if play.nil? || (play.player_one_sign.present? && play.player_one_sign.present?)
      play = Play.create
      play.players_match_id = match.id
    end
    
    if(match.player_1_id == current_user.id)
      play.player_one_sign = @sign
    else
      play.player_two_sign = @sign
    end
    play.save
  end
end
