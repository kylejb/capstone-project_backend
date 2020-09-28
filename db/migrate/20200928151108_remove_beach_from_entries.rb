class RemoveBeachFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :beach_id, :string
  end
end
