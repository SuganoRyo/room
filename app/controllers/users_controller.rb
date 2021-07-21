class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  before_action :login?, only: :show
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path, notice: "ログインに成功しました"
    else
      render :new
    end
  end

  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if current_user.update(user_params)
    redirect_to user_path, notice: "編集しました"
    else
    render :edit
    end
  end
  
   private
  def user_params
    params.require(:user).permit(:nickname, :image, :introduction, :email, :password, :password_confirmation)
  end
end