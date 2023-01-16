class AddPnrCodeToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :pnr_code, :string
  end
end
