class ResultController < ApplicationController
  def game_result
    @dictionary = params[:commit]
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
  end
end
