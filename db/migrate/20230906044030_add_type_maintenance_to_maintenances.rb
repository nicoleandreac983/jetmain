class AddTypeMaintenanceToMaintenances < ActiveRecord::Migration[7.0]
  def change
    add_reference :maintenances, :type_maintenance, null: false, foreign_key: true
  end
end
