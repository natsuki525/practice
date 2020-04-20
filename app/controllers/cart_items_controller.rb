class CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		if @cart_item.save
			redirect_to cart_items_path
		else
		end

	end
	
	def index
    	@cart_items = CartItem.where(customer_id: current_customer.id)
    	@subtotal = 0
    	@cart_items.each do |cart_item|
      		@subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
    	end

  	end

	private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
    end
end
