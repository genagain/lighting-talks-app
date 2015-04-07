class Comment < ActiveRecord::Base
  belongs_to :talk

  validates :talk_id, presence: true
  validates :content, presence: true
end
