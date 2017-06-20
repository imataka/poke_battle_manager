class BattlesController < ApplicationController
  def index
  end

  def new
    @battle = Battle.new
    @my_pokes = MyPoke.party
    3.times do
      @battle.battle_my_pokes.build
      @battle.opp_pokes.build
    end
  end

  def show
  end

  def create
    Battle.create(battle_params)
    redirect_to action: 'index'
  end

  private
  def battle_params
    params.require(:battle).permit(:my_rate, :opp_rate, :result, 
                                   battle_my_pokes_attributes: [:battle_id, :my_poke_id],
                                   opp_pokes_attributes: [:name, :item, :ability], 
                                   battle_opp_pokes_attributes: [:battle_id, :opp_poke_id], 
                                  )
  end
end
