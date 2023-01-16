class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    @booking = current_user.booking
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    seat = Seat.find_by(pnr: booking_params["seat_prn"])
    category_code = seat.category.pnr_code
    respond_to do |format|
      if @booking.save
        seat.update(booked: true)
        format.html { redirect_to user_bookings_path(@booking), notice: "Booking was successfully created." }
      else
        format.html { redirect_to "/search?pnr=#{category_code}&commit=serach", notice: "the seat is booked" }
      end
    end
  end

  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.permit(:seat_prn, :user_id, :price)
    end
end
