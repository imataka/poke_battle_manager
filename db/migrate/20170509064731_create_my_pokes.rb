class CreateMyPokes < ActiveRecord::Migration
  def change
    create_table :my_pokes do |t|
      t.string :name
      t.string :item
      t.string :ability

      t.timestamps null: false
    end
  end
end
