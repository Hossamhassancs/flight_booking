class CategoriesController < ApplicationController

  def search
    
    @category = Category.find_by(pnr_code: params["pnr"])
    @seats = @category&.seats
  end


end
