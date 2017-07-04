class OppPoke < ActiveRecord::Base
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :battles, :through => :battle_opp_pokes
  has_many :evals, dependent: :destroy

  accepts_nested_attributes_for :battle_opp_pokes, allow_destroy: true

  # Returns Array of id of objects whose name corresponds to argument
  class << self
    def ids_by_name(name)
      self.where(name: name).map { |o| o.id }
    end
  end
end
