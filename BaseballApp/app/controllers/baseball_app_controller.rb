class BaseballAppController < ApplicationController
  include BaseballAppHelper

  def index
    puts "--------------------- In Index -------------------------"
    @allPlayers = PlayerModel.all
    puts "# of players = #{@allPlayers.size}"

    if params[:commit] == "Sort by Name"
      @allPlayers.sort_by{ |player| player.name}
    elsif params[:commit] == "Sort by OBP"
      @allPlayers = PlayerModel.all.sort_by{ |player| player.obp}
    else
      @allPlayers = PlayerModel.all
    end

    # Make lineup start out empty
    @lineup = nil

     # Check if there are at least 9 players for lineup generation once button is pressed
    if params[:commit] == "Generate Lineup"
      if @allPlayers.count >= 9
        @lineup = optimized_lineup(@players)
      end
    end

    if params[:searchInput].present?
      @searchedRows = PlayerModel.where('name LIKE ?', "%#{params[:searchInput]}%")
      if @searchedRows.size == 0
        puts "There are no Players with this name or string of characters in their name. "
      end
    else
      @searchedRows = nil
    end
  end

  def handlePost
    if params[:commit] == "Enter Player Information"
      self.enterPlayer
    end
    if params[:commit] == "Sort by Name"
      self.index
    end
    if params[:commit] == "Sort by Name"
      self.index
    end
    if params[:commit] == "Sort by Name"
      self.index
    end
    if params[:commit] == "Sort by Name"
      self.index
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
      end
    end
  end

  def deletePlayer
    puts "----------------------- In Delete Player ---------------------------"
    deletedRow = PlayerModel.find_by(params[:nameInput])
    if deletedRow.destroy
      puts "Success!"
      redirect_to baseball_app_url
    end
  end

  def clearSearch
    param[:searchInput] = nil
    redirect_to baseball_app_url
  end

  def sortByName
    @allNames = PlayerModel.all.sort
  end

  def sortByOBP
    @allPlayers = PlayerModel.all.sort_by{ |player| [-player.obp, player.name, player.avg, player.slg, player.ops] }
  end

  def sortByAVG
    @allPlayers.sort_by[player.avg]
  end

  def sortBySLG
    @allPlayers.sort_by[player.slg]
  end

  def sortByOPS
    @allPlayers.sort_by[player.ops]
  end
end
