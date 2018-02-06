class SongsController < ApplicationController
  def index
    @songs = Song.all
  end


  def new
    @song = Song.new
  end

  def create
    @Song = Song.create(song_params)
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def show
    @song = Song.find_by(id: params[:id])
    @genre = Genre.find(@song.genre_id)
    @artist = Artist.find(@song.artist_id)
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
