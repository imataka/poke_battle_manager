class AddOrderToBattleMyPokes < ActiveRecord::Migration
  def change
    add_column :battle_my_pokes, :order, :integer
  end
end
