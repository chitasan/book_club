class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.string  :content
      t.string  :user_name
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
