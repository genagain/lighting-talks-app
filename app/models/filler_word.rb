class FillerWord < ActiveRecord::Base
  has_many :wasted_words
  has_many :talks, through: :wasted_words
end
