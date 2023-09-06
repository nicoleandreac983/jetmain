class AddEngineToMaintenances < ActiveRecord::Migration[7.0]
  def change
    add_reference :maintenances, :engine, null: false, foreign_key: true
  end
end
