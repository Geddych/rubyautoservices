class ChangeCategoryTypeInService < ActiveRecord::Migration[7.0]
  def up
    change_table :services do |t|
      t.change :category, :string
    end
  end
end
