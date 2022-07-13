class AddWorkTimeToServ < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :worktime,:integer
  end
end
