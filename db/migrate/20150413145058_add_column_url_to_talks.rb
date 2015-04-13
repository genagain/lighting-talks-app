class AddColumnUrlToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :video_url, :string
  end
end
