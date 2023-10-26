class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(model: params[:vehicle][:model],
                          brand: params[:vehicle][:brand],
                          plate: params[:vehicle][:plate],
                          problem_description: params[:vehicle][:problem_description],
                          year: params[:vehicle][:year],
                          entry_km: params[:vehicle][:entry_km],
                          entry_date: Time.now
    )

    if @vehicle.save
      return redirect_to vehicle_path(@vehicle.id)
    end

    render :new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])      
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(model: params[:vehicle][:model],

      brand: params[:vehicle][:brand],
      plate: params[:vehicle][:plate],
      problem_description: params[:vehicle][:problem_description],
      year: params[:vehicle][:year],
      entry_km: params[:vehicle][:entry_km]
      )

      return redirect_to vehicle_path

    end

    render :edit
  end

  def exit_vehicle
    @vehicle = Vehicle.find_by(plate: params[:plate])
    @vehicle.update(service_description: params[:service_description],
                    exit_km: params[:exit_km]
    )
    @vehicle.exit_date = Time.now

    return redirect_to vehicle_path(@vehicle.id)
  end

  def exit_vehicle_form; end
end