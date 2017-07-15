class PokesController < ApplicationController
  def name_autocomp
    render json: PokeData.like(params[:item].to_sym => "#{params[:term]}%").map { |i| i.name }.uniq
  end
end
