class MyPoke < ActiveRecord::Base
  has_many :battle_my_poke, dependent: :destroy
  has_many :battles, :through => :battle_my_poke
end
