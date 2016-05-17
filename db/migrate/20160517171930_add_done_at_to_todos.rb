class AddDoneAtToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :done_at, :datetime
  end
end
