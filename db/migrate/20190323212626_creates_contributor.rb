class CreatesContributor < ActiveRecord::Migration[5.1]
  def change
    create_table :contributor do |t|
      t.string :name
      t.string :github
    end
  end
end
