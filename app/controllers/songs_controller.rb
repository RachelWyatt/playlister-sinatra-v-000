class SongsController < ApplicationController

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end


end
