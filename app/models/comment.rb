class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user
  validates :talk_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
