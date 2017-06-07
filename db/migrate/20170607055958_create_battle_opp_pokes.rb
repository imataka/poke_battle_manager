class CreateBattleOppPokes < ActiveRecord::Migration
  def change
    create_table :battle_opp_pokes do |t|
      t.references :battle, index: true, foreign_key: true
      t.references :opp_poke, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
