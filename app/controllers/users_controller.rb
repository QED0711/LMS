class UsersController < ApplicationController
  def login
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirm]
      @user = User.new(user_params)
      render :new, alert: "Passwords did not match"
    end
    user = User.create(user_params)
    current_user=(user)
    redirect_to user_path(user)
    # binding.pry
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
