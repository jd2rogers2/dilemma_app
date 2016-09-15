class OptionsController < ApplicationController
  def new
    @option = current_user.current_dilemma.options.new
  end

  def create
    @option = current_user.current_dilemma.options.create(option_params)
    redirect_to option_path(@option)
    # maybe not valid because no dilemma_id being passed?
    # keep getting error cannot call create parent is not saved
    # referring to calling create in factors_attr= in model
  end

  def edit
  end

  def update
  end

  def show
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
  end

  def destroy
    # likely needs to be fixed
    # refactor this to use before_destroy :delete_factors
    # do same refactor for dilemma
    @option = Option.find_by(id: params[:id])
    @option.factors.each {|fact| @option.factors.delete(fact)}
    Option.delete(@option)
    redirect_to dilemma_path(current_user.current_dilemma)
  end

  private
  def option_params
    params.require(:option).permit(:name, factors_attributes: [:name, :points])
  end
end
