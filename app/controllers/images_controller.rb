class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new  
  end

  def create
    gallery = current_user.galleries.find(params[:gallery_id])
    image = Image.new(image_params)
    if image.save
      redirect_to gallery
    else
      render :new
    end
  end

  def edit
    @image = @gallery.images.find(params[:id])
  end

  def update
    @image = gallery.images.find(params[:id])
    if @image.update(image_params)
      redirect_to gallery.images
    else 
      render :edit  
    end
  end

private

  def image_params
    params.require(:image).permit(:url).
    merge(gallery_id: params[:gallery_id])
   end

  
end