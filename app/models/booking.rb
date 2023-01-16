class Booking < ApplicationRecord
  belongs_to :user
  validates :seat_prn, uniqueness: true
end
