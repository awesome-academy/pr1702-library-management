class DropAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    drop_table :author_books
  end
end
