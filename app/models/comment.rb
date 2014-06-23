class Comment < ActiveRecord::Base
  belongs_to :image

  validates :body, presence: true
  validates :user_id, presence: true

end