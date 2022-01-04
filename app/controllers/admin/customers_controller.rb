class Admin::CustomersController < ApplicationController

   def index
   @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
      flash[:notice_update] = "会員情報を更新しました！"
    else
      edit_admins_customer_path(@customer)
    end
 end
 private
   def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_customer_status)
   end
end