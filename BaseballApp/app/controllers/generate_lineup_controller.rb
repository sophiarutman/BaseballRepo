class GenerateLineupController < ApplicationController
include GenerateLineupHelper
  def index
  end

  def generateBatterLineup
    @players = PlayerModel.all
    @indexes = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    @lineup = optimized_lineup(@players)
    render 'generate_batter_lineup'
  end
end
