class CreateOrderLists < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lists do |t|
      t.integer :order_id
      t.integer :service_id

      t.timestamps
    end
  end
end
