class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
    redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item)
      flash[:notice_update] = "情報を更新しました！"
    else
      redirect_to edit_admin_items_path(@item)
    end

  end

private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at,)
  end
end
