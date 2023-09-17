class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false, index: true
      t.integer :books_count

      t.timestamps
    end
  end
end
