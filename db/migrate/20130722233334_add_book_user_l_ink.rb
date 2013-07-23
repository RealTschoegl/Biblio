class AddBookUserLInk < ActiveRecord::Migration
  def change
    # add_reference :books, :user, index: true
    add_column :books, :user_id, :integer
    add_index :books, :user_id
  end
end
