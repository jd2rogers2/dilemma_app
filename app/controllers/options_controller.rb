class OptionsController < ApplicationController
  def new
    @option = current_user.current_dilemma.options.new
  end

  def create
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
    @option = Option.find_by(id: params[:id])
    @option.factors.each {|fact| @option.factors.delete(fact)}
    Option.delete(@option)
    redirect_to dilemma_path(current_user.current_dilemma)
  end

  private
  def option_params
    params.require(:option).permit(:name, factor_attributes: [:name, :points])
  end
end
