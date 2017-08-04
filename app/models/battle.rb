class Battle < ActiveRecord::Base
  has_many :battle_my_pokes, dependent: :destroy
  has_many :my_pokes, -> { order "battle_my_pokes.id ASC" },
    :through => :battle_my_pokes
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :opp_pokes, :through => :battle_opp_pokes
  has_many :evals, dependent: :destroy

  accepts_nested_attributes_for :battle_my_pokes, allow_destroy: true
  accepts_nested_attributes_for :battle_opp_pokes, allow_destroy: true
  accepts_nested_attributes_for :opp_pokes, allow_destroy: true

  validates :my_rate, presence: true
  validates :opp_rate, presence: true
  validate :my_poke_should_be_unique, :opp_poke_name_should_be_unique

  # helperでやったほうがいいのかもしれない
  def result_ja
    if result == true then
      "勝ち"
    else
      "負け"
    end
  end

  def destroy_opp_poke_with_space
    opp_pokes.each do |i|
      i.destroy if i.name == ""
    end
  end

  # validations
  def my_poke_should_be_unique
    my_poke_ids = battle_my_pokes.map { |i| i.my_poke_id }
    if my_poke_ids.size != my_poke_ids.uniq.size then
      errors.add(:my_pokes, "同じポケモンを登録することはできません")
    end
  end

  def opp_poke_name_should_be_unique
    opp_poke_names = opp_pokes.map { |i| i.name }
    if opp_poke_names.size != opp_poke_names.uniq.size then
      errors.add(:opp_pokes, "同じポケモンを登録することはできません")
    end
  end
end
