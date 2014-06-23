class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  respond_to :json

  def index
    respond_with Item.all
  end

  def create
    respond_with Item.create(item_params)
  end

  def show
    respond_with @item
  end

  def update
    respond_with @item.update(item_params)
  end

  def destroy
    respond_with @item.destroy
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :categeory_id)
  end

end

