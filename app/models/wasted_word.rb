class WastedWord < ActiveRecord::Base
  belongs_to :filler_word
  belongs_to :talk
end
