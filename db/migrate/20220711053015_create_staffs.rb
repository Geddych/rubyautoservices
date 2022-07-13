class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :surname
      t.string :name
      t.string :specialization
      t.integer :category

      t.timestamps
    end
  end
end
