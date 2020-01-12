class ApplicationController < ActionController::Base
	before_action :set_current_user

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	def dm_authenticate_users
		@dm = Dm.find_by(id: params[:id])
		unless @dm.user1 == @current_user.id or @dm.user2 == @current_user.id
			session[:user_id] = nil
			redirect_to("/")
			flash[:notice] = "不正なアクションです。ログアウトしました。"
		end		
	end

	def authenticate_users
		if @current_user == nil
			redirect_to("/users/login")
			flash[:notice] = "ログインしてください。"
		end
	end

end
