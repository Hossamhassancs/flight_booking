class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :seats_in_row
      t.integer :numbers_of_rows
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
