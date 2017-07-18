class AddInPartyToMyPokes < ActiveRecord::Migration
  def change
    add_column :my_pokes, :in_party, :boolean
  end
end
