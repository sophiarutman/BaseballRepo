class SortBySlgController < ApplicationController
  def sortSLG
    @slgPlayers = PlayerModel.all.sort_by{|players| [-players.slg, players.name]}
  end
end
