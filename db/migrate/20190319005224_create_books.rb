class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :pub_date
      t.string :book_cover_photo

      t.timestamps
    end
  end
end
