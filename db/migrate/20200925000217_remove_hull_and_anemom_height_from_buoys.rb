class RemoveHullAndAnemomHeightFromBuoys < ActiveRecord::Migration[6.0]
  def change
    remove_column :buoys, :hull
    remove_column :buoys, :anemom_height
  end
end
