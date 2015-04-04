class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :topic, null: false
      t.date :date, null:false
      t.text :description
    end
  end
end
