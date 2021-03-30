class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :name, null: false
      t.date :start_day, null: false
      t.date :end_day, null: false
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
