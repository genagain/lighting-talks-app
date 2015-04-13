class Talk < ActiveRecord::Base
  has_many :comments

  validates :topic, presence: true
  validates :date, presence: true
end
