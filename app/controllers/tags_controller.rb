class TagsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
  end
end
