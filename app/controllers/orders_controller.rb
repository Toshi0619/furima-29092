class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :move_to_root]
  before_action :move_to_root, only: [:index, :create]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
      pay_item
      @address_order.save

      redirect_to root_path

    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if (user_signed_in? && current_user.id == @item.user_id) || @item.order.present?

    redirect_to root_path unless user_signed_in?
  end

  def address_order_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
