class Comment < ActiveRecord::Base
  belongs_to :talk
  validates :content, presence: { message: "You cannot submit a blank comment" }
end
