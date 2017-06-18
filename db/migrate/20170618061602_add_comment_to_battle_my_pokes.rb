class AddCommentToBattleMyPokes < ActiveRecord::Migration
  def change
    add_column :battle_my_pokes, :comment, :text
  end
end
