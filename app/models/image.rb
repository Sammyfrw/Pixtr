class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :group_images
  has_many :groups, through: :group_images

  has_many :likes


  has_many :image_tags
  has_many :tags, through: :image_tags


  validates :url, presence: true
  validates :gallery, presence: true

  def tag_list
    tag_array = []
    tags.map do |tag|
    tag_array << tag.tagname.to_s
    end
  tag_array.join(", ")
  end

  def tag_list=(new_tag_list)
    tag_names = new_tag_list.split(",")
    new_tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(tagname: tag_name.strip.downcase)
    end
  self.tags = new_tags
  save
  end

  def add_tags(tag_params)
    tag_names = tag_params[:tagname].split(",")
    new_tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(tagname: tag_name.strip.downcase)
    end
    self.tags = new_tags
    save
  end
end