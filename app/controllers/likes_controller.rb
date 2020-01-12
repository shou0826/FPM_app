class LikesController < ApplicationController

	def create
		@like = Like.new(
			active_user_name: @current_user.name,
			active_user: @current_user.id,
			passive_user: params[:id]
			)
		if @like.save
			redirect_to("/users/#{@like.passive_user}")
			flash[:notice] = "いいね！しました"
		else
			redirect_to("/users/#{@like.passive_user}")
			flash[:notice] = "いいね！できませんでした"
		end
	end

	def destroy
		@like = Like.find_by(active_user: @current_user.id, passive_user: params[:id])
		@like.destroy
		redirect_to("/users/#{@like.passive_user}")
		flash[:notice] = "いいね！を取り消しました"
	end

end