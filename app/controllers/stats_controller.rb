class StatsController < ApplicationController
  def index
  end

  def new
  end

  def show
    # TODO: 現在パーティにいるポケモンと全てのポケモンでtoggle
    @my_pokes = MyPoke.all.sort_by { |p| -p.average(3) }
    @opp_names = OppPoke.sorted_name
    @opp_ids = @opp_names.map {|name| OppPoke.ids_by_name(name) }
  end

  def edit
  end
end
