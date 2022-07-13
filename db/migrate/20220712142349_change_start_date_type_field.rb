class ChangeStartDateTypeField < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|  
      t.change :start_date, :datetime 
    end
  end
end
