class Engine < ApplicationRecord
  enum type_engine: {
    'Motor a reacción' => 0,
    'Motor turbohélice' => 1
  }
  has_many :maintenances, dependent: :destroy
#Validaciones.
  validates :name, presence: true, uniqueness: true, format: { with: /\A(REAC|TURBO)-\d+\z/i, message: 'debe seguir el formato REAC-n o TURBO-n' }
  validates :descripcion, presence: true
  validates :type_engine, presence: true
  validates :photo, presence: true
end
