class Eval < ActiveRecord::Base
  belongs_to :battle
  belongs_to :my_poke
  belongs_to :opp_poke

  class << self
    def average_for_poke(my_poke_id, opp_poke_ids, ndigits)
      self.where(my_poke_id: my_poke_id, opp_poke_id: opp_poke_ids).average(:eval).round(ndigits).to_f
    end
  end
end
