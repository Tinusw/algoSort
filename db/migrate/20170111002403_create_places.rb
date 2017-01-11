class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.float :q1
      t.float :q2
      t.float :q3
      t.float :q4
      t.float :q5
      t.timestamps
    end
  end
end
