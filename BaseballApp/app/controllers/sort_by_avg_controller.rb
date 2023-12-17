class SortByAvgController < ApplicationController
  def sortAVG
    @avgPlayers = PlayerModel.all.sort_by{|players| [-players.avg, players.name]}
  end
end
