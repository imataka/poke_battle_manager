class OppPoke < ActiveRecord::Base
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :battles, :through => :battle_opp_poke
  has_many :eval, dependent: :destroy
end
