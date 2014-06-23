class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  validates :body, presence: true
  validates :user_id, presence: true

  def self.recent
    order(created_at: :desc).limit(2)
  end

end