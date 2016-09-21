class DilemmasController < ApplicationController
  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = current_user.dilemmas.create(dilemma_params)
    current_user.current_dilemma = @dilemma.id
    redirect_to dilemma_path(@dilemma)
  end

  def edit
    @dilemma = current_user.current_dilemma
  end

  def update
    @dilemma = current_user.dilemmas.find_by(id: params[:id])
    @dilemma.update(dilemma_params)
    redirect_to dilemma_path(@dilemma)
  end

  def show
    set_dilemma
    if @dilemma.user == current_user
      current_user.current_dilemma = current_user.dilemmas.find_by(id: params[:id])
    end
  end

  def index
  end

  def destroy
    set_dilemma
    @dilemma.destroy
    redirect_to dilemmas_path
  end

  def overdue
  end

  private
  def dilemma_params
    params.require(:dilemma).permit(:name, "deadline(3i)", "deadline(2i)", "deadline(1i)", tags_attributes: [:name], tag_ids: [])
  end

  def set_dilemma
    @dilemma = Dilemma.find_by(id: params[:id])
  end
end
