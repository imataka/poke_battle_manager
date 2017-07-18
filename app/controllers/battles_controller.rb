class BattlesController < ApplicationController
  def index
    @battles = Battle.all
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
    @battle = Battle.find(params[:id])
    # Viewで複数回これを参照するためcontrollerでインスタンス変数として定義
    @my_pokes = @battle.my_pokes
    @opp_pokes = @battle.opp_pokes
  end

  def create
    battle = Battle.new(battle_params)
    battle.save

    # ここでevalを作っておくことでeval#newでブラウザバックされても変なことにならない
    battle.my_pokes.each do |m|
      battle.opp_pokes.each do |o|
        e = battle.evals.build
        e.my_poke_id = m.id
        e.opp_poke_id = o.id
        e.eval = 0
        e.save
      end
    end

    session[:battle_id] = battle.id
    redirect_to controller: :evals, action: :new
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
