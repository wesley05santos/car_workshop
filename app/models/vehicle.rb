class Vehicle < ApplicationRecord
  validates :model, :plate, :brand, :problem_description, :entry_km, presence: true 
end
