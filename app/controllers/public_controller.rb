class PublicController < ApplicationController
	before_action :authenticate_users
	
	def index
		@public = Public.all
	end

	def new
	end

	def create
		@public = Public.new(
			name: @current_user.name,
			text: params[:text]
			)
		@public.save
		redirect_to("/public/index")
	end

	def show
		@public = Public.find_by(id: params[:id])
	end

	def edit
		@public = Public.find_by(id: params[:id])
	end

	def update
		@public = Public.find_by(id: params[:id])
		@public.text = params[:text]
		@public.save
		redirect_to("/public/#{@public.id}")
		flash[:notice] = "編集を保存しました"
	end

	def destroy
		@public = Public.find_by(id: params[:id])
		@public.destroy
		redirect_to("/public/index")
		flash[:notice] = "削除しました"
	end

end