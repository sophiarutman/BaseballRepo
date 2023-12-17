class BaseballAppController < ApplicationController

  def index
    puts "--------------------- In Index -------------------------"
    @allPlayers = PlayerModel.all
    puts "# of players = #{@allPlayers.size}"
  end

  def enterPlayer
    puts "--------------------- In Enter Player ---------------------"
    name = params[:nameInput]
    obp = params[:obpInput]
    avg = params[:avgInput]
    slg = params[:slgInput]
    ops = params[:opsInput]
    deleteInput = params[:deleteInput]
    map = {"name" => name, "obp" => obp, "avg" => avg,"slg" => slg,"ops" => ops}
    newRow = PlayerModel.new(map)
    respond_to do |format|
      if newRow.save
        puts "Success!"
        format.html{redirect_to baseball_app_url}
      end
    end
  end

  def redirectToDeleteController
    redirect_to delete_app_url
  end
end
