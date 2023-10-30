class Vehicle < ApplicationRecord
  validates :model, :plate, :brand, :problem_description, :entry_km, presence: { message: 'deve ser preenchido' }
  validate :entry_km_smaller_than_exit_km
  before_validation :batata
  private
  def entry_km_smaller_than_exit_km
    return if !exit_km.present? || entry_km <= exit_km

    errors.add('KM saida', "não pode ser menor que km de entrada")
  end

  def batata
    return if exit_date.nil?
    
    errors.add('KM saida', "não pode ficar em branco") if exit_km.nil?
    errors.add('Descrição do serviço', "não pode ficar em branco") if service_description.nil?
  end
end
