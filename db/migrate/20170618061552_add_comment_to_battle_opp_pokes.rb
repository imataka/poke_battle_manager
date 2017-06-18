class AddCommentToBattleOppPokes < ActiveRecord::Migration
  def change
    add_column :battle_opp_pokes, :comment, :text
  end
end
