class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new(purchasehistory_address_params)
    if  @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path
    else
      render :"orders/index"
    end
  end

  private

  def purchasehistory_address_params
    params.require(:purchase_history_address).permit(:postal_cord, :prefectures_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchasehistory_address_params[:token],
      currency: 'jpy' 
    )
  end
end
