class CreateFavoriteBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_beaches do |t|
      t.references :beach, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
