class BattlesController < ApplicationController
  def index
  end

  def new
    @battle = Battle.new
    @battle.opp_pokes.build
    @battle.my_pokes.build
  end

  def show
  end

  def create
    Battle.create(battle_params)
  end

private
  def battle_params
    params.require(:battle).permit(:my_rate, :opp_rate, opp_pokes_attributes: [:name, :item], my_pokes_attributes: [:name, :item])
  end
end
