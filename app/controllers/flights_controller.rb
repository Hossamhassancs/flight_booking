class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  def index
    @flights = Flight.all
  end

  def show
  end

  def new
    @flight = Flight.new
  end

  def edit
  end

  def create
    @flight = Flight.new(aeroplan_type: flight_params["aeroplan_type"], origin: flight_params["origin"], destination: flight_params["destination"])
    
    respond_to do |format|
      if @flight.save
        seats_configs = flight_params.except("aeroplan_type" ,"origin", "destination")
        @flight.setup_categories_and_seats(seats_configs)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:aeroplan_type, :origin, :destination, :seats_in_row_for_first_class, :numbers_of_rows_for_first_class, :seats_in_row_for_business_class, :numbers_of_rows_for_business_class, :seats_in_row_for_economy_class, :numbers_of_rows_for_economy_class)
    end
end
