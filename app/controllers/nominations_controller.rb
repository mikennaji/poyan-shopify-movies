class NominationsController < ApplicationController
  def index
  end

  def create
  # Post
  raise
  @nomination = Nomination.new(user: current_user, imdb_id: params[:imdbID])
  if @nomination.save
    flash.notice = "New nomination created!"
  else
    flash.notice = "Error occured!"
  end
  end

  # private
  # def nomination_params
  #   params.require(:nomination).permit(:imdb_id)
  # end

end
