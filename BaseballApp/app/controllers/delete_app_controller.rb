class DeleteAppController < ApplicationController

  def index
    if params[:deleteInput].present?
      @deletedRows = PlayerModel.find_by(name: params[:deleteInput])
      if @deletedRows == nil
        puts "Failure"
      elsif @deletedRows.destroy
        puts "Success"
        redirect_to baseball_app_url
      end
    end
  end
end
