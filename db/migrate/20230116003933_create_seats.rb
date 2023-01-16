class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :pnr
      t.integer :seat_type
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
