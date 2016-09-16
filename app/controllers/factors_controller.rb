class FactorsController < ApplicationController
  def destroy
    @factor = Factor.find_by(id: params[:format])
    @option = @factor.option
    @factor.delete
    redirect_to option_path(@option)
  end
end
