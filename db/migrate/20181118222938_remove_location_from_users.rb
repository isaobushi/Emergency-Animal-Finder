class RemoveLocationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :location, :float
  end
end
