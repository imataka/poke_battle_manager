class EvalsController < ApplicationController
  def index
  end

  def new
    @battle = Battle.find(session[:battle_id])
    # Viewで複数回これを参照するためcontrollerでインスタンス変数として定義
    @my_pokes = @battle.my_pokes
    @opp_pokes = @battle.opp_pokes

    # form_tag > field_for で参照するため定義したけどもっといい方法がありそうな……
    @battle_my_pokes = @my_pokes.map { |m| m.battle_my_pokes.find_by(battle_id: @battle.id) }
    @battle_opp_pokes = @opp_pokes.map { |o| o.battle_opp_pokes.find_by(battle_id: @battle.id) }
    @choices = (-3..3).to_a.reverse.map {|i| [i, i] } # [[3, 3], [2, 2], ..., [-3, -3]]
    (@battle.my_pokes.count * @battle.opp_pokes.count).times do
      @battle.evals.build.save
    end
  end

  def create
    # 3つのModelに対してupdate処理をしてるけどこれももっといい方法がありそうな気がする
    # evals_paramsを通すとidとparamがmapで取れてすごい
    evals_params.map do |id, eval_param|
      e = Eval.find(id)
      e.update_attributes(eval_param)
      e.save
    end
    
    battle_my_pokes_params.map do |id, bm_param|
      bm = BattleMyPoke.find(id)
      bm.update_attributes(bm_param)
      bm.save
    end
    
    battle_opp_pokes_params.map do |id, om_param|
      om = BattleOppPoke.find(id)
      om.update_attributes(om_param)
      om.save
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

  def battle_my_pokes_params
    params.permit(battle_my_pokes: [:comment])[:battle_my_pokes]
  end

  def battle_opp_pokes_params
    params.permit(battle_opp_pokes: [:comment])[:battle_opp_pokes]
  end
end
