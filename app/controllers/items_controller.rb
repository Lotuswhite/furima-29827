class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :status_id, :shopping_status_id, :prifecture_id, :scheduled_id, :price ).merge(user_id: current_user.id)
  end
end
