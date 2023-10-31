class VehiclesController < ApplicationController
  before_action :time_zone
  
  def index
    @vehicles = Vehicle.where(exit_date: nil)
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
                          entry_date: Time.zone.now
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
    @vehicle = Vehicle.where(plate: params[:plate]).order(updated_at: :desc).first
    if @vehicle.nil?
      flash[:notice] = 'Placa não encontrada'  
      return render :exit_vehicle_form     

    end

    if @vehicle.exit_date.present?
      flash[:notice] = 'Veículo já foi realizado a Saída Anteriormente!!!'    
      return redirect_to root_path

    end  
    @vehicle.exit_date = Time.zone.now
    @vehicle.service_description = params[:service_description].empty? ? nil : params[:service_description]
    @vehicle.exit_km = params[:exit_km]    
    return redirect_to vehicle_path(@vehicle.id) if @vehicle.save

    render :exit_vehicle_form    
  end

  def exit_vehicle_form; end

  def time_zone
    Time.zone = 'America/Sao_Paulo'
  end

  def vehicle_history
    @vehicles = Vehicle.where(plate: params[:plate])
    # binding.break
    if @vehicles.empty?
      flash[:notice] = 'Placa não encontrada'  
      return render :vehicle_history_form     

    end

    render :index
  end

  def vehicle_history_form; end
end
