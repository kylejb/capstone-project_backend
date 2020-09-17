class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.date :session_date
      t.time :session_time
      t.text :entry
      t.string :wave_quality

      t.timestamps
    end
  end
end
