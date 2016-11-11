class AddNestStatus < ActiveRecord::Migration[5.0]
  def change
    change_table :readings do |t|
      t.boolean :status
    end
  end
end
