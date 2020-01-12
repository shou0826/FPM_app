class UsersController < ApplicationController

  before_action :authenticate_users,{only: [:index, :player_index, :edit, 
  :edit_content, :show, :new, :create_content, :create, :update, 
  :update_content, :destroy]}

  def index
  	@user = User.all
  end

  def player_index
    @user = User.all
    @profile = Profile.all
  end

  def mypage
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def edit_content
  	@user = User.find_by(id: params[:id])
  	@profile = Profile.find_by(user_id: @user.id)
  end

  def show
  	@user = User.find_by(id: params[:id])
    @profile = Profile.find_by(user_id: @user.id)
    @like = Like.find_by(active_user: @current_user.id, passive_user: params[:id])
    @like_count = Like.where(passive_user: params[:id]).count
    @like_index = Like.where(passive_user: params[:id])
    @dm = Dm.where(user1: params[:id]).or(Dm.where(user2: params[:id]))
  end

  def signup
  	@user = User.new
  end

  def new
    @user = User.find_by(id: params[:id])
  end

  def create_content
    @user = User.find_by(id: params[:id])
    @profile = Profile.new(
      user_id: @user.id,
      user_name: @user.name,
      ps_id: params[:ps_id],
      first_position: params[:first_position],
      second_position: params[:second_position],
      third_position: params[:third_position],
      attendance: params[:attendance],
      time_zone: params[:time_zone],
      time_zone_rear: params[:time_zone_rear],
      vc: params[:vc],
      ligue: params[:ligue],
      text: params[:text]
      )
    @profile.save
    redirect_to("/users/#{@user.id}")
  end

  def create
  	@user = User.new(
  		name: params[:name],
  		email: params[:email],
  		password: params[:password]
  		)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to("/users/index")
  		flash[:notice] = "新規登録しました"
  	else
  		render("users/signup")
    end
  end

  def update
  	@user = User.find_by(id: params[:id])
  	@user.name = params[:name]
  	@user.email = params[:email]
  	@user.password = params[:password]
  	if @user.save
  		redirect_to("/users/#{@user.id}")
  		flash[:notice] = "編集を保存しました"
  	else
  		render("users/edit")
  	end
  end

  def update_content
    @user = User.find_by(id: params[:id])
    @profile = Profile.find_by(user_id: params[:id])
    @profile.ps_id = params[:ps_id]
    @profile.first_position = params[:first_position]
    @profile.second_position = params[:second_position]
    @profile.third_position = params[:third_position]
    @profile.attendance = params[:attendance]
    @profile.time_zone = params[:time_zone]
    @profile.time_zone_rear = params[:time_zone_rear]
    @profile.vc = params[:vc]
    @profile.ligue = params[:ligue]
    @profile.text = params[:text]
    @profile.save
    redirect_to("/users/#{@user.id}")
  end

  def destroy
  	@user = User.find_by(id: params[:id])
    @profile = Profile.find_by(user_id: @user.id)
  	@user.destroy
    @profile.destroy
    session[:user_id] = nil
  	redirect_to("/users/index")
  	flash[:notice] = "削除しました"
  end

  def login_form
  	@user = User.new
  end

  def login
  	@user = User.find_by(
  		email: params[:email],
  		password: params[:password]
  		)
  	if @user
  		session[:user_id] = @user.id
  		redirect_to("/users/#{@user.id}")
  		flash[:notice] = "ログインに成功しました"
  	else
  		@error_message = "メールアドレスまたはパスワードが間違っています"
  		@email = params[:email]
  		@password = params[:password]
  		render("users/login_form")
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to("/users/login")
  	flash[:notice] = "ログアウトしました"
  end


end
