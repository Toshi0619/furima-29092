class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit] # showもついかしないとログインしてなければ、index画面に吹き飛ばされる
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit]
  before_action :move_to_root, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
    # Itemテーブルから一覧データを取得
  end

  def new
    @item = Item.new # インスタンスを生成（テーブルに格納する箱を生成）、form_withにモデルのクラスを渡す。
  end

  def create
    @item = Item.new(item_params)
    if @item.save # 保存されるとリダイレクトされるのでビューファイルはいらない
      redirect_to action: :index
    else # 保存できなければ、newからやり直し
      render action: :new
    end
  end

  def show
  end

  def edit
    # redirect_to new_user_session_path unless user_signed_in?

    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    redirect_to root_path if user_signed_in? && current_user.id != @item.user_id
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :beard_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
