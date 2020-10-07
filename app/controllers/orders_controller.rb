class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    # @item = Item.find(params[:item_id])
    @order = OrderForm.new

  end

  def new
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit( :prifecture_id, :token, :postnumber, :prifecture, :city, :housenumber, :housename, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    #URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること
    #@order = Item.find(params[:item_id])
    #redirect_to root_path if current_user.id == @order.user_id
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_61a63ea1706ec0ecdcad72dc"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end