class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new # インスタンスを生成（テーブルに格納する箱を生成）、form_withにモデルのクラスを渡す。
  end

  def create
    @item = Item.create(item_params) #データを保存する
    if @item.save #保存されるとリダイレクトされるのでビューファイルはいらない
      redirect_to action: :index
    else #保存できなければ、newからやり直し
      render action: :new    
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :beard_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
