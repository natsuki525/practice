class CustomersController < ApplicationController

	def show
		@customer = current_customer
	end
	def edit
		@customer = current_customer
	end
	def update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect customer_path
			flash[:notice_update] = "会員情報が更新されました！"
		else
			render 'edit'
		end
	end
end
