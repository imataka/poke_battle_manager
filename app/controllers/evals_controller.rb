class EvalsController < ApplicationController
  def index
  end

  def new
    @battle = Battle.find(session[:battle_id])
    @choices = (-3..3).to_a.reverse.map {|i| [i, i] } # [[3, 3], [2, 2], ..., [-3, -3]]
    (@battle.my_pokes.count * @battle.opp_pokes.count).times do
      @battle.evals.build
    end
  end

  def update
    battle = Battle.find(battle_params[:id])
    battle_params[:evals_attributes].each do |e|
      evaluation = Eval.new(eval_params)
      battle.evals << evaluation
    end
    battle.save
    redirect_to controller: :battles, action: :index
  end

  def show
  end

  def edit
  end

  private
  def battle_params
    params.require(:battle).permit(:id, evals_attributes: [:eval, :my_poke_id, :opp_poke_id])
  end
end
