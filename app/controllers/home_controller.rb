class HomeController < ApplicationController 
  def index
    @vehicles = Vehicle.where(exit_date: nil)
    render 'vehicles/index'
  end
end

