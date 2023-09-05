class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.string :name_engine
      t.string :photo
      t.string :email

      t.timestamps
    end
  end
end
