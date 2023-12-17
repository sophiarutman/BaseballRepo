class SearchAppController < ApplicationController

  def index
    if params[:searchInput].present?
      @searchedRows = PlayerModel.where('name LIKE ?', "%#{params[:searchInput]}%")
      if @searchedRows.size == 0
        puts "There are no Players with this name or string of characters in their name. "
      end
    else
      @searchedRows = nil
    end
  end

  def clearSearch
    puts "CLEAR SEARCH"
    param[:searchInput] = nil
    redirect_to search_app_url
  end

end
