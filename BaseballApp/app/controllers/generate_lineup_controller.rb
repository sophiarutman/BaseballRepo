class GenerateLineupController < ApplicationController
include GenerateLineupHelper
  def index
  end

  def generateBatterLineup
    @lineup = optimized_lineup(@players)
  end
end
