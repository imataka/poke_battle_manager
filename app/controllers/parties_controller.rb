class PartiesController < ApplicationController
  def index
    @my_pokes = MyPoke.all
    @new_my_poke = MyPoke.new
  end

  def update
    in_party_params.map do |id, param|
      my_poke = MyPoke.find(id)
      my_poke.update(param)
      my_poke.save
    end

    redirect_to controller: :parties, action: :index
  end

  def create_poke
    @my_poke = MyPoke.new(my_poke_params)

    if @my_poke.save
      status = 'succeess'
      editor_html = render_to_string partial: 'editor', locals: { my_poke: @my_poke }
      choice_html = render_to_string partial: 'choice', locals: { my_poke: @my_poke }
    else
      status = 'error'
    end

    render json: { status: status, data: @my_poke, editor_html: editor_html, choice_html: choice_html }
  end

  def update_poke
    @my_poke = MyPoke.find(params[:id])

    if @my_poke.update(my_poke_params)
      status = 'success'
    else
      status = 'error'
    end

    render json: { status: status, data: @my_poke }
  end

  def destroy_poke
    @my_poke = MyPoke.find(params[:id])
    @my_poke.destroy

    render json: { status: 'success', data: @my_poke }
  end

  def my_poke_params
    params.require(:my_poke).permit(:name, :item, :ability)
  end

  def in_party_params
    params.permit(my_pokes: [:in_party])[:my_pokes]
  end
end
