class AddFatherIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :father_id, :int
  end
end
