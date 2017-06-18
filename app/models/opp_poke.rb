class OppPoke < ActiveRecord::Base
  has_many :battle_opp_poke, dependent: :destroy
  has_many :battles, :through => :battle_opp_poke
end
