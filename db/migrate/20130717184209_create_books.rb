class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :picture
      t.string :title
      t.string :author
      t.datetime :published
      t.string :isbn
      t.reference :user

      t.timestamps
    end
  end
end
