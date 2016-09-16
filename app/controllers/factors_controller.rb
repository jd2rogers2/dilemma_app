class FactorsController < ApplicationController

  def new
    @option = current_user.current_dilemma.options.find_by(id: params[:option_id])
    @factor = @option.factors.new
  end

  def create
    binding.pry
  end

  def destroy
    @factor = Factor.find_by(id: params[:format])
    @option = @factor.option
    @factor.delete
    redirect_to option_path(@option)
  end
end
