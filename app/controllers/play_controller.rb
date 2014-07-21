class PlayController < ApplicationController
  require 'games.rb'
  # Ritornare l'elenco di tutte le azioni possibili
  def index
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
end
