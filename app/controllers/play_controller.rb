class PlayController < ApplicationController
  require 'games.rb'
  # Ritornare l'elenco di tutte le azioni possibili
  def index
    @games = ::Game.new.universal_dictionary
  end
end
