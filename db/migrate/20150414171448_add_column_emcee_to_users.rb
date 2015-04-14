class AddColumnEmceeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emcee, :date
  end
end
