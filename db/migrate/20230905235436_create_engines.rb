class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.string :type_engine
      t.timestamps
    end
  end
end
