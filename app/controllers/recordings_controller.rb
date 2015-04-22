class RecordingsController < ApplicationController
  def new
    @talk = Talk.find(params[:talk_id])
    redirect_to talk_path(@talk)
    start_recording(@talk)
  end

  def create
    @talk = Talk.find(params[:talk_id])
    speech_processor = SpeechProcessor.new
    @talk.transcript = speech_processor.decode("#{@talk.id}.wav")
    @talk.save
    redirect_to talk_path(@talk)
  end

  def start_recording(talk)
    dev = CoreAudio.default_input_device
    buf = dev.input_buffer(1024)

    wav = CoreAudio::AudioFile.new("#{talk.id}.wav", :write, format: :wav,
                                   rate: dev.nominal_rate,
                                   channels: dev.input_stream.channels)
    samples = 0
    th = Thread.start do
      loop do
        w = buf.read(4096)
        samples += w.size / dev.input_stream.channels
        wav.write(w)
      end
    end

    buf.start
    sleep 10
    buf.stop
    th.kill.join

    wav.close
  end
end
