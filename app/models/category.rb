class Category < ApplicationRecord

  #relations
  belongs_to :flight
  has_many :seats

  #validations
  validates :seats_in_row, :numbers_of_rows, presence: true

  #callbacks
  after_create :setup_the_seats
  after_create :set_pnr_code

  def set_pnr_code
    self.update(pnr_code: genrate_pnr_code)
  end

  def setup_the_seats
    number_of_seats= self.seats_in_row * self.numbers_of_rows
    (1..number_of_seats).each do |num|
      self.seats.create(pnr: genrate_pnr_code, seat_type: 1, price: 50 )
    end
  end

  private

  def genrate_pnr_code
    [*('A'..'Z'),*('0'..'9')].shuffle[0,8].join
  end

end
