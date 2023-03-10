class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :seat_prn
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
