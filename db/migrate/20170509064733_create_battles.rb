class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.int :my_id
      t.int :opp_id
      t.int :my_rate
      t.int :opp_rate
      t.boolean :result

      t.timestamps null: false
    end
  end
end
