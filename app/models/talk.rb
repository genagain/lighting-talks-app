class Talk < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :topic, presence: true
  validates :date, presence: true
end
