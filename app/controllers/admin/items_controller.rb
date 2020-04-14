class Admin::ItemsController < ApplicationController

	def new
		@item = Item.new
		@genres = Genre.all
	end
	def create
		@item = Item.new(item_params)
		@genres = Genre.all
		if @item.save
			redirect_to admin_items_path
      		flash[:notice_new] = "商品が登録されました!"
    	else
      		render :new
    	end
	end
	def index
		@items = Item.all
	end
	def show
		@item = Item.find(params[:id])
	end
	def edit
		@item = Item.find(params[:id])
		@genres = Genre.all
	end
	def update
		@item = Item.find(params[:id])
		@genres = Genre.all
		if @item.update
			redirect_to admin_item_path(@item)
			flash[:notice_update] = "商品が更新されました！"
		else
			render :edit
		end
	end

	private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sold, :created_at, :updated_at)
    end
end
