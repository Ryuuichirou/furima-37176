class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new(purchasehistory_address_params)
    if @purchase_history_address.valid?
      @purchase_history_address.save
      redirect_to root_path
    else
      render :"orders/index"
    end
  end

  private

  def purchasehistory_address_params
    params.require(:purchase_history_address).permit(:postal_cord, :prefectures_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
