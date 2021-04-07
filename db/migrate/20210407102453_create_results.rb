class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :money, null: false
      t.integer :item_category_id
      t.string  :note
      t.references :travel, foreign_key: true
      t.references :group_user, foreign_key: true
      t.timestamps
    end
  end
end
