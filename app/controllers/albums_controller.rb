class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

	def new
		@album = current_user.albums.new
  end

  def create
  	
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def index
    @albums = current_user.albums
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
  
    if @album.update(album_params)
      redirect_to album_path
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to @album
    end
  end
  
  def commentable_area
  end  

  private
    def album_params
      params.require(:album).permit(:name, :description)
    end

end