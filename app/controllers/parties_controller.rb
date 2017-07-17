class PartiesController < ApplicationController
  def index
    @my_pokes = MyPoke.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def update_poke
    @my_poke = MyPoke.find(params[:id])

    if @my_poke.update_attributes(my_poke_params)
      status = 'success'
    else
      status = 'error'
    end

    render json: { status: status, data: @my_poke }
  end

  def my_poke_params
    params.require(:my_poke).permit(:name, :item, :ability)
  end
end
