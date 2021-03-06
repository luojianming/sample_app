class Micropost < ActiveRecord::Base
  attr_accessible :content
  validates :user_id, presence: true
  belongs_to :user
  default_scope order: 'microposts.created_at DESC'
  validates :content, presence: true, length: { maximum: 140 }
end
