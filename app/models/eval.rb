class Eval < ActiveRecord::Base
  belongs_to :battle
  belongs_to :my_poke
  belongs_to :opp_poke
end
