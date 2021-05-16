class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, :unique => true, :null => false
      t.string :email, :unique => true, :null => false
      t.timestamps
    end
  end
end

