class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchaseHistory_address = DonationAddress.new(purchaseHistory_address_params)
    if @purchaseHistory_address.valid?
      @purchaseHistory_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchaseHistory_address_params
    params.require(:purchaseHistory_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id)
  end
end
