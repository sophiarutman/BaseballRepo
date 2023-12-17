class SortByNameController < ApplicationController
  def sort
    @namePlayers = PlayerModel.all.sort_by{|players| [players.name]}
  end
end
