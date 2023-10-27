class Vehicle < ApplicationRecord
  validates :model, :plate, :brand, :problem_description, :entry_km, presence: { message: 'deve ser preenchido' } #:plate, :brand, :problem_description, :entry_km, presence: true
  # validates :exit_km, :service_description
  validate :entry_km_smaller_than_exit_km
  private
  def entry_km_smaller_than_exit_km
    return if !exit_km.present? || entry_km <= exit_km

    errors.add('KM saida', "não pode ser menor que km de entrada")
  end
end
