class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :price
      t.integer :category

      t.timestamps
    end
  end
end