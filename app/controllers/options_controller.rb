class OptionsController < ApplicationController
  def new
    binding.pry
    # @dilemma = Dilemma.find_by(id: params) from hidden
    # @option = @dilemma.options.build
    @option = Option.new
  end

  def create
    # @dilemma = Dilemma.find_by(id: params) from hidden
    # @option = @dilemma.options.create(option_params)
    # redirect_to option_path(@option)
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
