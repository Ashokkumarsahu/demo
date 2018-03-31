class PhotosController < ApplicationController
  
  before_action :set_event, only: [:new,:create,:show, :destroy]

	def new
		@photo = @album.photos.new
  end

  def create
		@photo = @album.photos.new(photo_params)
    if @photo.save
      redirect_to @album
    else
      render 'show'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
     redirect_to album_path(@album)
    else
      render 'album/show'
    end
  end

  def add_cover_photo
    @album = current_user.albums.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @album.update_column('cover_id', @photo.id)
    redirect_to @album
  end

  private

    def set_event
      @album = current_user.albums.find(params[:album_id])
    end

    def photo_params
      params.require(:photo).permit(:name, :image)
    end
end
