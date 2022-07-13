class ChangeStaffRef < ActiveRecord::Migration[7.0]
  def change
    add_column :order_lists, :staff_id, :integer
    remove_column :orders, :staff_id
  end
end
