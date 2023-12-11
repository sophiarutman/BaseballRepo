class BaseballAppController < ApplicationController
  include BaseballAppHelper

  def index
    puts "--------------------- In Index -------------------------"
    @allPlayers = PlayerModel.all
    puts "# of players = #{@allPlayers.size}"
    @allPlayers = @allPlayers.sort
    
    # Make lineup start out empty
    @lineup = nil

     # Check if there are at least 9 players for lineup generation once button is pressed
    if params[:commit] == "Generate Lineup"
      if @allPlayers.count >= 9
        @lineup = optimized_lineup(@players)
      end
    end
  end

  def enterPlayer
    puts "--------------------- In Enter Bid ---------------------"
    name = params[:nameInput]
    obp = params[:obpInput]
    avg = params[:avgInput]
    slg = params[:slgInput]
    ops = params[:opsInput]
    map = {"name" => name, "obp" => obp, "avg" => avg,"slg" => slg,"ops" => ops}
    newRow = PlayerModel.new(map)
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