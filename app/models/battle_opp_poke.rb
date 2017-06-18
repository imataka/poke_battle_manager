class BattleOppPoke < ActiveRecord::Base
  belongs_to :battle
  belongs_to :opp_poke
end
