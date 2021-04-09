class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string :nickname, null: false
      t.integer :money, null: false
      t.integer :item_category_id
      t.string  :note
      t.references :travel_select, foreign_key: true
      t.timestamps
    end
  end
end
