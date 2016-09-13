class DilemmasController < ApplicationController
  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = current_user.dilemmas.create(dilemma_params)
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

  def destroy
  end

  private
  def dilemma_params
    params.require(:dilemma).permit(:name, "deadline(3i)", "deadline(2i)", "deadline(1i)")
  end
end
