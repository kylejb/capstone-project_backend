class AddAttributesToBuoys < ActiveRecord::Migration[6.0]
  def change
    add_column :buoys, :pgm, :string
    add_column :buoys, :type, :string
    add_column :buoys, :elev, :float
    add_column :buoys, :met, :string
    add_column :buoys, :hull, :string
    add_column :buoys, :anemom_height, :float
  end
end
