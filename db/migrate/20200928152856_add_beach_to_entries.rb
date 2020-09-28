class AddBeachToEntries < ActiveRecord::Migration[6.0]
  def change
    # beach is currently optional
    add_reference :entries, :beach, null: true, foreign_key: true
  end
end
