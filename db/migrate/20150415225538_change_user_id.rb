class ChangeUserId < ActiveRecord::Migration
  def change
    change_column :talks, :user_id, :integer, null: false
  end
end
