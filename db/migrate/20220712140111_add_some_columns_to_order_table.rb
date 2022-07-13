class AddSomeColumnsToOrderTable < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :telephone,:string
    add_column :orders, :status, :string
    add_column :orders, :start_date,:string
    add_column :orders, :worktime, :integer
  end
end
