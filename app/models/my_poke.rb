class MyPoke < ActiveRecord::Base
  has_many :battle_my_pokes, dependent: :destroy
  has_many :battles, :through => :battle_my_pokes
  has_many :evals, dependent: :destroy

  # パーティから外れているポケモンも管理するとき用に
  # パーティに入っているかを管理するフラグを用意してtrueなポケモンのみ返す
  def self.party
    self.where(in_party: true)
  end
end
