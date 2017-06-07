class CreateBattleMyPokes < ActiveRecord::Migration
  def change
    create_table :battle_my_pokes do |t|
      t.references :battle, index: true, foreign_key: true
      t.references :my_poke, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
