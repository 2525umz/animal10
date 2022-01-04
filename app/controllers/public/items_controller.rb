class Public::ItemsController < ApplicationController
before_action :set_q, only: [:index, :search]
 def index
  @genres = Genre.all
  @items = Item.all.page(params[:page]).per(8)

 end



 def show
  @item = Item.find(params[:id])
  @genres = Genre.all
  @cart_item = CartItem.new
  @post_comment = PostComment.new
 end

private

  def set_q
    @q = Genre.ransack(params[:q])
  end
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
end

