class CreateFillerWords < ActiveRecord::Migration
  def change
    create_table :filler_words do |t|
      t.string :word, null: false
    end
  end
end
