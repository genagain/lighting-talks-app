class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates :content, presence: { message: "You cannot submit a blank comment" }
  validates :talk_id, presence: true
  validates :user_id, presence: true
end
