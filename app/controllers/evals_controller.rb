class EvalsController < ApplicationController
  def index
  end

  def new
    @battle = Battle.find(session[:battle_id])
    @choices = (-3..3).to_a.reverse.map {|i| [i, i] } # [[3, 3], [2, 2], ..., [-3, -3]]
    (@battle.my_pokes.count * @battle.opp_pokes.count).times do
      @battle.evals.build.save
    end
  end

  def create
    evals_params.map do |id, eval_param|
      e = Eval.find(id)
      e.update_attributes(eval_param)
      e.save
    end
    redirect_to controller: :battles, action: :index
  end

  def show
  end

  def edit
  end

  private
  def evals_params
    params.permit(evals: [:eval, :my_poke_id, :opp_poke_id])[:evals]
  end
end
