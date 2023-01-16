class Flight < ApplicationRecord

  #relations
  has_many :categories, dependent: :destroy

  #validations
  validates :aeroplan_type, :origin, :destination, presence: true


  FLIGHT_CATEGORIES = ["First_Class", "Business_Class", "Economy_Class"]
  
  def setup_categories_and_seats(options)
    FLIGHT_CATEGORIES.each do |category| 
      category_seat_in_row = options["seats_in_row_for_#{category.downcase}"]
      category_number_of_rows = options["numbers_of_rows_for_#{category.downcase}"]
      created_category = self.categories.create(name: category, seats_in_row: category_seat_in_row, numbers_of_rows: category_number_of_rows)
      number_of_seats= created_category.seats_in_row * created_category.numbers_of_rows
        (1..number_of_seats).each do |num|
          created_category.seats.create(pnr: genrate_pnr_code, seat_type: 1, price: options["seat_price_for_#{category.downcase}"] )
        end
    end
    

  end
  
end
