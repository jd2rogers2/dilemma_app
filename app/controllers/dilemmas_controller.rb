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
  end

  def update
  end

  def show
    current_user.current_dilemma = current_user.dilemmas.find_by(id: params[:id])
  end

  def index
  end

  def destroy
    # not deleting all options for some reason
    # may have fixed it, still needs testing
    # waiting on options#create to work
    @dilemma = Dilemma.find_by(id: params[:id])
    @dilemma.options.each {|opt| opt.delete}
    @dilemma.delete
    redirect_to dilemmas_path
  end

  private
  def dilemma_params
    params.require(:dilemma).permit(:name, "deadline(3i)", "deadline(2i)", "deadline(1i)")
  end
end
