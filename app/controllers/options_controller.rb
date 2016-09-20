class OptionsController < ApplicationController
  def new
    @option = Option.new
  end

  def create
    @option = current_user.current_dilemma.options.create(option_params)
    valid_factors?
    redirect_to option_path(@option)
  end

  def edit
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
  end

  def update
    @option = current_user.current_dilemma.options.find_by(id: params[:id])
    @option.update(option_params)
    # valid_factors?
    # not working with update :(
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
    params.require(:option).permit(:name, factors_attributes: [:name, :points, :id])
  end

  def valid_factors?
    if @option.errors.messages[:factors] == ["is invalid"]
      @option.factors.each do |f|
        f.delete if f.invalid?
      end
      @option.save
      flash[:message] = "points entry must only be numbers"
    end
  end
end
