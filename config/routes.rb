Rails.application.routes.draw do
  root to: 'home#index'
  get 'exit_vehicle_form', to: 'vehicles#exit_vehicle_form'
  delete 'exit_vehicle', to: 'vehicles#exit_vehicle'
  get 'vehicle_history', to: 'vehicles#vehicle_history'

  resources :vehicles
end
