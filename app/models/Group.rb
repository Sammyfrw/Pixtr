class Group < ActiveRecord::Base
  has_many :users
  has_many :group_memberships
  has_many :group_images
  has_many :images, through: :group_images

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
