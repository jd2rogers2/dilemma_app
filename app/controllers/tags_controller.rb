class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tag_path(@tag)
  end

  def edit
    @tag = Tag.find_by(id: params[:id])
  end

  def update
    @tag = Tag.find_by(id: params[:id])
    @tag.update(tag_params)
    redirect_to tag_path(@tag)
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
