class ChangeTimeToDateTimeForEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :session_start_time
    add_column :entries, :session_start_time, :datetime
  end
end
