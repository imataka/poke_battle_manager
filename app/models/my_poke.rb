class MyPoke < ActiveRecord::Base
  has_many :battle_my_pokes, dependent: :destroy
  has_many :battles, :through => :battle_my_poke
  has_many :eval, dependent: :destroy
end
