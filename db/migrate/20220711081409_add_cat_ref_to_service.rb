class AddCatRefToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :categories, foreign_key: true
  end
end
