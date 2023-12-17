class SortByOpsController < ApplicationController
  def sortOPS
    @opsPlayers = PlayerModel.all.sort_by{|players| [-players.ops, players.name]}
  end
end
