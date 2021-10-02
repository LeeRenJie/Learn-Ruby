class AddBodyToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :body, :text
  end
end
