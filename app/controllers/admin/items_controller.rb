class Admin::ItemsController < ApplicationController

	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to admin_items_path
      		flash[:notice_new] = "商品が登録されました!"
    	else
      		render :new
    	end
	end

	private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sold, :created_at, :updated_at)
    end
end
