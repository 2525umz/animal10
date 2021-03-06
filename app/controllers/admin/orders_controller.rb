class Admin::OrdersController < ApplicationController

  def show
  @order = Order.find(params[:id])
	@order_details = @order.order_details
end

def update
  order = Order.find(params[:id])
		order_details = order.order_details
    order.update(order_params)

		if order.status == "入金確認"
			order_details.update_all(making_status: "製作待ち")
		end
		redirect_to order_path(order.id)
end

 def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
 end

 def order_confirm_params
   params.require(:order).permit(:payment_method)
 end
end
