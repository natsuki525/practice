class Admin::GenresController < ApplicationController

	def index
		@genres = Genre.all
		@genre = Genre.new
	end
	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admin_genres_path
			flash[:notice_genre] = 'ジャンルを追加しました！'
		else
			@genres = Genre.all
			render 'index'
		end
	end
	private
	def genre_params
		params.require(:genre).permit(:name,:is_active)
	end
end
