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
      @player_1 = User.get_user_by_email(@opponent)
      @player_2 = current_user
    else
      @player_1 = current_user
      @player_2 = User.get_user_by_email(@opponent)
    end
    @match = Match.find_match_by_id(@player_1.id ,@player_2.id)
  end
  
  def game_processor
    @parameters = params[:play]
    @opponent = @parameters.tr('"\[],','').split(' ')[0]
    @sign = @parameters.tr('"\[],','').split(' ')[1]
    
    match = Match.find_match_by_id(User.get_user_by_email(@opponent).id , current_user.id )
    
    play = Match.find_all_plays_by_match(match.id).last
    
    if(plays.last.player_one_sign.nil? && plays.last.player_two_sign.nil?)
      match.plays.last = Play.create
    end
    if(match.player_1_id == current_user.id)
      plays.last.player_one_sign = @sign
    else
      plays.last.player_two_sign = @sign
    end
    
  end
end
