class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name, null: false, index: true
      t.string :status, null: false, default: "available"
      t.string :isbn, null: false, index: true

      t.timestamps
    end
  end
end
