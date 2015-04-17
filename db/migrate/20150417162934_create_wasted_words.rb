class CreateWastedWords < ActiveRecord::Migration
  def change
    create_table :wasted_words do |t|
      t.integer :filler_word_id, null: false
      t.integer :talk_id, null: false
    end
  end
end
