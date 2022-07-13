class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :machine,:string
    add_column :orders, :reg_number, :string
  end
end
