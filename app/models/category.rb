class Category < ApplicationRecord

  #relations
  belongs_to :flight
  has_many :seats

  #validations
  validates :seats_in_row, :numbers_of_rows, presence: true

  #callbacks
  after_create :set_pnr_code

  def set_pnr_code
    self.update(pnr_code: genrate_pnr_code)
  end

end
