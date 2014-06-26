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
end