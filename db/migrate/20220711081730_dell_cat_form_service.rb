class DellCatFormService < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :category, :string
  end
end
