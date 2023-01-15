class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :aeroplan_type
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
