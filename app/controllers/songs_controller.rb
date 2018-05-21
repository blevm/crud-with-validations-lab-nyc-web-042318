class SongsController < ApplicationController
  before_action :get_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    #only needs before_action
  end

  def edit
    #only needs before_action
  end

  def update
    @song = Song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :release_year, :artist_name, :genre)
  end
end
