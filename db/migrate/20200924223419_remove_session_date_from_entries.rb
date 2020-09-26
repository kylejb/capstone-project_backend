class RemoveSessionDateFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :session_date
  end
end
