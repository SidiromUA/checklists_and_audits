# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    @items = Item.order(id: :desc).paginate(page: params[:page], per_page: 4)
  end

  def new
    @item = Item.new
  end

  def show; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      redner 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
