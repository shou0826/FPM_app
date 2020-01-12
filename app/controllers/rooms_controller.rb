class RoomsController < ApplicationController
	before_action :set_current_user
	before_action :dm_authenticate_users, {only: :show}

	def show
	  	@dm = Dm.find_by(id: params[:id])
	  	@user1 = User.find_by(id: @dm.user1)
	  	@user2 = User.find_by(id: @dm.user2)
	  	@messages = Message.where(room_id: @dm.id)
	  	gon.dm_id = @dm.id
	end

	def create
		@dm = Dm.new(
			user1: @current_user.id,
			user2: params[:id]
			)
		@dm.save
		redirect_to("/rooms/#{@dm.id}")
	end

	def index
		@dm = Dm.where(user1: params[:id]).or(Dm.where(user2: params[:id]))
		@user = User.all
	end


end
