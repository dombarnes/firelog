class CreateModel < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.datetime :date
      t.decimal :outdoor_temperature
      t.decimal :indoor_temperature
      t.timestamps null: false
    end

    create_table :events do |t|
      t.string :description
      t.datetime :date
    end
  end
end
