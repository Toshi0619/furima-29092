class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new # インスタンスを生成（テーブルに格納する箱を生成）
  end

  def create
    @item = Item.create(item_params) #データを保存する
    if @user.save #保存されるとリダイレクトされるのでビューファイルはいらない
      redirect_to action: :index
    else #保存できなければ、newからやり直し
      action: :new    
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    paramas.require(:item).permit(:image, :name, :description, :catagory_id, :status_id, :beard_id, :area_id, :days_id, :price, :user)
end
