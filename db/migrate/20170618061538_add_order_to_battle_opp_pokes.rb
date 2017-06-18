class AddOrderToBattleOppPokes < ActiveRecord::Migration
  def change
    add_column :battle_opp_pokes, :order, :integer
  end
end
