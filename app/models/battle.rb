class Battle < ActiveRecord::Base
  has_many :battle_my_pokes, dependent: :destroy
  has_many :my_pokes, :through => :battle_my_poke
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :opp_pokes, :through => :battle_opp_poke

  accepts_nested_attributes_for :battle_my_poke, allow_destroy: true
  accepts_nested_attributes_for :battle_opp_poke, allow_destroy: true
end
