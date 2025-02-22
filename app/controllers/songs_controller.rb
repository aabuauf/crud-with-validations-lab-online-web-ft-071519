require 'pry'

class SongsController < ApplicationController


  def new
    @song = Song.new
  end

  def create
    
    @song = Song.new(song_params)
   
    if @song.valid?
      @song.save
      
      redirect_to "/songs/#{@song.id}"
    else
      # re-render the :new template WITHOUT throwing away the invalid @

      render :new
    end

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    Song.find(params[:id]).destroy
    redirect_to "/songs"
  end

  def index
    
    @songs =Song.all
   
    
  end

  def show
 
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)

  end
end
