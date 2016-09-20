class FactorsController < ApplicationController

  def new
    @option = current_user.current_dilemma.options.find_by(id: params[:option_id])
    @factor = @option.factors.new
  end

  def create
    if factor_params[:points].to_i == 0 && factor_params[:points] != "0"
      flash[:alert] = "numbers only for point entry"
      @option = Option.find_by(id: factor_params[:option_id])
      redirect_to new_factor_path(option_id: @option.id, flash: true)
    else
      @factor = Factor.create(factor_params)
      redirect_to option_path(@factor.option_id)
    end
  end

  def destroy
    @factor = Factor.find_by(id: params[:id])
    @option = @factor.option
    @factor.delete
    redirect_to option_path(@option)
  end

  private
  def factor_params
    params.require(:factor).permit(:name, :points, :option_id)
  end
end
