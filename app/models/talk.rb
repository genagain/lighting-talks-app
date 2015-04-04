class Talk < ActiveRecord::Base
  validates :topic, presence: true
  validates :date, presence: true
end
