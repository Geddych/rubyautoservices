class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer
      t.integer :staff_id
      t.integer :total_price

      t.timestamps
    end
  end
end
