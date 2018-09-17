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
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to current_user
    else
      @user = user
      render :new
    end
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
