class WelcomeController < ApplicationController
  def index
    @games = ::Game.new.universal_dictionary
  end
end
