class OppPoke < ActiveRecord::Base
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :battles, :through => :battle_opp_pokes
  has_many :evals, dependent: :destroy

  accepts_nested_attributes_for :battle_opp_pokes, allow_destroy: true

  validates :name, inclusion: { in: PokeData.all_names }

  class << self
    # Returns Array of id of objects whose name corresponds to argument
    def ids_by_name(name)
      self.where(name: name).map { |o| o.id }
    end

    # Returns Array of name sorted by count
    def sorted_name
      self.group(:name).count(:name).sort_by{ |_, v| -v }.to_h.keys
    end
  end
end
