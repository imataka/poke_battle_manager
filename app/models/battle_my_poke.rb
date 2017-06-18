class BattleMyPoke < ActiveRecord::Base
  belongs_to :battle
  belongs_to :my_poke
end
