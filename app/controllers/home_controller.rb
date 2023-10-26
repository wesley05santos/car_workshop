class HomeController < ApplicationController 
  def index
    @vehicles = Vehicle.all
    render 'vehicles/index'
  end
end

