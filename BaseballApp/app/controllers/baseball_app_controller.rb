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

    if params[:searchInput].present?
      puts @searchedRow
    end
  end

  def enterPlayer
    puts "--------------------- In Enter Player ---------------------"
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
      #else
        #format.html{redirect_to error_page_url}
      end
    end
  end

  def deletePlayer
    puts "----------------------- In Delete Player ---------------------------"
    deletedRow = PlayerModel.find_by(params[:nameInput])
    if deletedRow.destroy
      puts "Success!"
      redirect_to baseball_app_url
    else
      puts "PlayerNotFound"
    end
  end

  def searchPlayer
    puts "--------------------------In Search Player -----------------------------"
    @searchedRows = PlayerModel.where('name LIKE ?', "#{params[:searchInput]}")
    if @searchedRows
      puts "Success"
      redirect_to baseball_app_url
    else
      puts "PlayerNotFound"
    end
  end
end
