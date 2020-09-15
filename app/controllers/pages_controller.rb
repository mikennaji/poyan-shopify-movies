class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @nominations = current_user.nominations

    require 'json'
    require 'open-uri'

    @nomination_list = @nominations.map do |nom|
      url = "http://www.omdbapi.com/?i=#{nom.imdb_id}&apikey=adf1f2d7"
      nom_serialized = open(url).read
      JSON.parse(nom_serialized)
    end
  end
end
