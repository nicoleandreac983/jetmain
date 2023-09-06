class AddTownToMaintenances < ActiveRecord::Migration[7.0]
  def change
    add_reference :maintenances, :town, null: false, foreign_key: true
  end
end
