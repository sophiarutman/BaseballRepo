class BaseballAppController < ApplicationController
  def index
    puts "--------------------- In Index -------------------------"
    @allPlayers = Player.all
    puts "# of players = #{@allPlayers.size}"
    @allPlayers = @allPlayers.sort
  end

  def enterPlayer
    puts "--------------------- In Enter Bid ---------------------"
    name = params[:nameInput]
    obp = params[:obpInput]
    avg = params[:avgInput]
    slg = params[:slgInput]
    ops = params[:opsInput]
    map = {"name" => name, "obp" => obp, "avg" => avg,"slg" => slg,"ops" => ops}
    newRow = player_models.new(map)
    respond_to do |format|
      if newRow.save
        puts "Success!"
        format.html{redirect_to baseball_app_url}
      else
        format.html{redirect_to new_row_save_error_url}
      end
    end
  end
end
