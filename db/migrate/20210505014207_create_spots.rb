class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :genre, null: false
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
