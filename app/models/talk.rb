class Talk < ActiveRecord::Base
  has_many :comments
  has_many :wasted_words
  has_many :filler_words, through: :wasted_words
  belongs_to :user

  validates :topic, presence: true
  validates :date, presence: true

  def count_fillers
    word_counts = {}
    filler_words.each do |filler|
      key = filler.word.scan(/[a-z]/).join
      (word_counts.key?(key))? word_counts[key] += 1 : word_counts[key] = 1
    end
    word_counts
  end

  def find_wasted_words
    fillers = FillerWord.all
    fillers.each do |filler|
      regexp = Regexp.new filler.word
      count = transcript.scan(regexp).length
      count.times { WastedWord.create(filler_word_id: filler.id, talk_id: id) }
    end
  end

end
