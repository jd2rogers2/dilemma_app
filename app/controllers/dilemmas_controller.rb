class DilemmasController < ApplicationController
  def new
    @dilemma = Dilemma.new
  end

  def create
    binding.pry
    @dilemma = current_user.dilemmas.build(dilemma_params)
    redirect_to dilemma_path(@dilemma)
  end

  def edit
  end

  def update
  end

  def show
    @dilemma = current_user.dilemmas.find_by(id: params[:id])
  end

  def index
  end

  def delete
  end

  private
  def dilemma_params
    params.require(:dilemma).permit(:name, "deadline(3i)", "deadline(2i)", "deadline(1i)")
  end
end
