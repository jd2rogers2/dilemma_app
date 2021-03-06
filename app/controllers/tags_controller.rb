class TagsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :show, :index]
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tag_path(@tag)
  end

  def edit
    set_tag
  end

  def update
    set_tag
    @tag.update(tag_params)
    redirect_to tag_path(@tag)
  end

  def show
    set_tag
  end

  def index
    @tags = Tag.all
  end

  def destroy
    set_tag
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find_by(id: params[:id])
  end
end
