class PokesController < ApplicationController
  def name_autocomp
    render json: PokeData.like(name: "#{params[:term]}%").map { |i| {name: i.name} }.uniq
  end
end
