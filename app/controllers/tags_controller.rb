class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    # @image = @tag.images
  end

  def create
    image = Image.find(params[:image_id])
    tag_input = Tag.new
    tag_input.split_tags(tag_params, params[:image_id])
    redirect_to image
  end

    # @tag = Tag.new(tag_params)

    # if @tag.save
    #   ImageTag.create(tag_id: @tag.id, 
    #     image_id: params[:image_id])
    #   redirect_to root_path
    # else
    #   render "images/show"
    # end
    
  
    # if @tag.save
    #   redirect_to @image 
    # else
    #   render "images/show"
    # end
  

  private 
  def tag_params
    params.require(:tag).permit(:tagname) 
  end
end
