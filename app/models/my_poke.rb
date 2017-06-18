class MyPoke < ActiveRecord::Base
  has_many :battle_my_pokes, dependent: :destroy
  has_many :battles, :through => :battle_my_pokes
  has_many :evals, dependent: :destroy
end
