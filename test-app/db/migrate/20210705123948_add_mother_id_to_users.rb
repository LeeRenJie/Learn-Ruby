class AddMotherIdToUsers < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :mother_id, :int
  end
end
