class OppPoke < ActiveRecord::Base
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :battles, :through => :battle_opp_pokes
  has_many :evals, dependent: :destroy

  accepts_nested_attributes_for :battle_opp_pokes, allow_destroy: true
end
