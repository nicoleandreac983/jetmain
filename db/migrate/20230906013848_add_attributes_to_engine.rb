class AddAttributesToEngine < ActiveRecord::Migration[7.0]
  def change
    remove_column :engines, :type_engine
    add_column :engines, :type_engine, :integer
    add_column :engines, :name, :string
    add_column :engines, :descripcion, :text
    add_column :engines, :photo, :string
  end
end
