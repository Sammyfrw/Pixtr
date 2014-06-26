class ImageTag < ActiveRecord::Base
belongs_to :image
belongs_to :tag

# validates :user, uniqueness: {scope: :image}
end
