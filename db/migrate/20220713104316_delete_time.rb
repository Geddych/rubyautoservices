class DeleteTime < ActiveRecord::Migration[7.0]
  def change  
    remove_column :orders, :start_date, :datetime
  end
end
