class AddBookImageIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_image_id, :string
  end
end
