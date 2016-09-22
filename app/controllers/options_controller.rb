class OptionsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :show]
  def new
    @option = Option.new
  end

  def create
    @option = current_user.current_dilemma.options.create(option_params)
    valid_factors?
    redirect_to dilemma_option_path(@option.dilemma, @option)
  end

  def edit
    set_option
  end

  def update
    set_option
    @option.update(option_params)
    valid_factors?
    redirect_to dilemma_option_path(@option.dilemma, @option)
  end

  def show
    set_option
  end

  def destroy
    set_option
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

  def set_option
    @option = Option.find_by(id: params[:id])
  end
end
