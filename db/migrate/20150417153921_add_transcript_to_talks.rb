class AddTranscriptToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :transcript, :text
  end
end
