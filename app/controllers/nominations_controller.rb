class NominationsController < ApplicationController
  def create
    # Post
    @nomination = Nomination.new(user: current_user, imdb_id: params[:imdbID])
    redirect_to root_path
    if @nomination.save
      flash.notice = "New nomination created!"
    else
      flash.notice = "Error occured!"
    end
  end

  def destroy
    # raise
    @nomination = Nomination.find(params[:id])
    redirect_to root_path
    @nomination.destroy
    flash.notice = "Nomination deleted!"
  end
end
