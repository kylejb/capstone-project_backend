class CreateFavoriteBuoys < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_buoys do |t|
      t.references :buoy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :beach, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
