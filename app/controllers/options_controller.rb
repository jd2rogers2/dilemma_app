class OptionsController < ApplicationController
  def new
    @dilemma = current_user.current_dilemma
    @option = @dilemma.options.new
  end

  def create
    binding.pry
    @dilemma = current_user.current_dilemma
    @option = @dilemma.options.create(option_params)
    redirect_to option_path(@option)
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private
  def option_params
    params.require(:option).permit(:name, factor_attributes: [:name])
  end
end
