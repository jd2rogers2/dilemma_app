class OptionsController < ApplicationController
  def new
    @option = Option.new
  end

  def create
    @option = current_user.current_dilemma.options.create(option_params)
    redirect_to option_path(@option)
  end

  def edit
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
  end

  def update
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
    @option.update(option_params)
    # currently adding new instead of updating
    redirect_to option_path(@option)
  end

  def show
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
  end

  def destroy
    @option = Option.find_by(id: params[:id])
    @option.destroy
    redirect_to dilemma_path(current_user.current_dilemma)
  end

  private
  def option_params
    params.require(:option).permit(:name, factors_attributes: [:name, :points])
  end
end
