class UsersController < ApplicationController
  def login 
    if user_signed_in?
      redirect_to current_user
    end
    @user = User.new
    @path = "login"
  end

  def sign_in
    user = User.find_by(email: params[:user][:email])
    if !!user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to current_user
    else
      @user = user
      @path = 'login'
      redirect_to login_path, alert: "Unable to find user. Please check your credentials"
    end
  end

  def new
    if user_signed_in?
      redirect_to current_user
    end
    @user = User.new
    @path = "new"
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to current_user
    else
      @user = user
      render :new
    end
  end

  def show
    @user = current_user
    @lessons = @user.lessons
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
