class Flight < ApplicationRecord

  #relations
  has_many :categories

  #validations
  validates :aeroplan_type, :origin, :destination, presence: true


  FLIGHT_CATEGORIES = ["First_Class", "Business_Class", "Economy_Class"]
  
  def setup_categories_and_seats(options)
    FLIGHT_CATEGORIES.each do |category| 
      category_seat_in_row = options["seats_in_row_for_#{category.downcase}"]
      category_number_of_rows = options["numbers_of_rows_for_#{category.downcase}"]
      self.categories.create(name: category, seats_in_row: category_seat_in_row, numbers_of_rows: category_number_of_rows)
    end
  end
  
end
