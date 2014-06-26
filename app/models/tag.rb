class Tag < ActiveRecord::Base
  has_many :image_tags
  has_many :images, through: :image_tags

  def split_tags(tag_params, image_id)
    tag_names = tag_params[:tagname].split(",")
    tag_names.map do |tagname|
      tag = Tag.find_or_create_by(tagname: tagname.strip.downcase)
      if tag
        ImageTag.create(tag_id: tag.id, 
        image_id: image_id)
      end
    end
  end
end