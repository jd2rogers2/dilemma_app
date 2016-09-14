class OptionsController < ApplicationController
  def new
    @option = current_user.current_dilemma.options.new
  end

  def create
    binding.pry
    @option = current_user.current_dilemma.options.create(option_params)
    redirect_to option_path(@option)
  end

  def edit
  end

  def update
  end

  def show
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
  end

  def destroy
  end

  private
  def option_params
    params.require(:option).permit(:name, factor_attributes: [:name])
  end
end
