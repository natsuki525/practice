class ShippingsController < ApplicationController

	def index
		@shippings = current_customer.shippings.all
		@shipping = Shipping.new
	end
	def create
		@shipping = Shipping.new(shipping_params)
		@shipping.customer_id = current_customer.id
		if @shipping.save
			flash[:notice_create] = "新規配送先を登録しました！"
			redirect_to shippings_path
		else
			@shippings = current_customer.shippings.all
			render :index
		end
	end
	def edit
		@shipping = Shipping.find(params[:id])
	end
	def update
		@shipping = Shipping.find(params[:id])
		if @shipping.update(shipping_params)
			flash[:notice_fix] = "配送先情報を修正しました！"
			redirect_to shippings_path
		else
			render :edit
		end
	end


	private
	def shipping_params
    	params.require(:shipping).permit(:postcode, :address, :address_name)
	end
end
