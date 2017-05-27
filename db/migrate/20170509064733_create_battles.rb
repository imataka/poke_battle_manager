class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :my_id
      t.integer :opp_id
      t.integer :my_rate
      t.integer :opp_rate
      t.boolean :result

      t.timestamps null: false
    end
  end
end
