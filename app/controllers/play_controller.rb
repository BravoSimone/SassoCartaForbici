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
    @games = ::Game.new.universal_dictionary
    @match = Match.find(params[:match_id].to_i)
    @history = @match.match_plays.all.to_a
    @winners_string = generate_winners_strings(params[:match_id])
    @allowed_to_play = true
    
    if @match.match_plays.present?
      if @match.player_1_id == current_user.id
        if @match.match_plays.last.player_one_sign.present? && @match.match_plays.last.player_two_sign.nil?
          @allowed_to_play = false
        end
      else
        if @match.match_plays.last.player_two_sign.present? && @match.match_plays.last.player_one_sign.nil?
          @allowed_to_play = false
        end
      end
    end
  end
  
  def game_processor
    @sign = params[:play]
    @match = Match.find(params[:match_id])
    @match_id = @match.id
    play = @match.match_plays.last
    
    if play.nil? || (play.player_one_sign.present? && play.player_two_sign.present?)
      play = Play.create({:players_match_id => @match_id})
    end
    
    play = @match.match_plays.last
    
    if(@match.player_1_id == current_user.id)
      play.player_one_sign = @sign
      play.save
    else
      play.player_two_sign = @sign
      play.save
    end
    
    if play.present? && play.player_one_sign.present? && play.player_two_sign.present?
      # Control the winner
      @winner = Game.new.compare(play.player_one_sign, play.player_two_sign)
      if @winner[-1].to_i == 1
        @match.p1_win = @match.p1_win + 1
      elsif @winner[-1].to_i == 2
        @match.p2_win = @match.p2_win + 1
      end
    @match.save
    end
  end
end

def generate_winners_strings(match_id)
  plays = Match.find(match_id).match_plays.to_a
  games = Game.new
  winners_string = ''
  plays.reverse_each do |play|
    if play.player_one_sign.present? && play.player_two_sign.present?
      winners_string = winners_string + '-' + games.compare(play.player_one_sign, play.player_two_sign)
    end
  end
  winners_string
end