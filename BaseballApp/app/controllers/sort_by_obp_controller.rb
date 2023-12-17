class SortByObpController < ApplicationController
  def sortOBP
    @obpPlayers = PlayerModel.all.sort_by{|players| [-players.obp, players.name]}
  end
end
