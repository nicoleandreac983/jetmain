class AddMaterialToMaintenances < ActiveRecord::Migration[7.0]
  def change
    add_reference :maintenances, :material, null: false, foreign_key: true
  end
end
