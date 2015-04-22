require "pocketsphinx-ruby"

class SpeechProcessor
  include Pocketsphinx

  attr_accessor :decoder

  def initialize()
    @decoder = Decoder.new(Configuration.default)
  end

  def decode(file_path)
    @decoder.decode file_path
    @decoder.hypothesis
  end
end
