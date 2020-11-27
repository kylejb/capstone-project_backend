class AddBuoysToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :buoy, null: false, foreign_key: true
  end
end
