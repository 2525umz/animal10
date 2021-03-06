class Public::CartItemsController < ApplicationController

def index
@cart_items = current_customer.cart_items
end

def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(cart_item_params)
  redirect_to cart_items_path
end

def destroy
  cart_item = CartItem.find(params[:id])
  cart_item.destroy
  redirect_to cart_items_path
end

def destroy_all
  cart_item = current_customer.cart_items
  cart_item.destroy_all
  redirect_to cart_items_path
end

def create
@cart_item = CartItem.new(cart_item_params)
if @cart_item.save
redirect_to cart_items_path
else
@item = Item.find(params[:id])
@genres = Genre.all
@cart_item = CartItem.new
redirect_to template: "public/items/show"
end
end

private
 def cart_item_params
params.require(:cart_item).permit(:item_id, :customer_id, :amount, :created_at, :updated_at)
 end
end
