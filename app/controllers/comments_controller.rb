class CommentsController < ApplicationController

  def commentable_area
    if params[:album_id].present?
      @album = current_user.albums.find(params[:album_id])
      @comment = @album.comments.new
    elsif params[:photo_id].present?
      @photo = current_user.photos.find(params[:photo_id])
      @comment = @photo.comments.new
    end
    
  end 

  def create
    if params[:comment][:album_id].present?
      @album = current_user.albums.find(params[:comment][:album_id])
      @comment = @album.comments.new(comment_params)
      if @comment.save
        flash[:notice] = "Successfully created comment."
        redirect_to root_path
      else
        render  'new'
      end
    elsif params[:comment][:photo_id].present?
      @photo = current_user.photos.find(params[:comment][:photo_id])
      @comment = @photo.comments.new(comment_params)
      if @comment.save
        flash[:notice] = "Successfully created comment."
        redirect_to root_path
      else
        render  'new'
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end  
end