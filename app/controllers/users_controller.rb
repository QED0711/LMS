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
    if params[:instructor_token] == "secret"
      user.instructor!
    else
      user.student!
    end

    if user.save
      session[:user_id] = user.id
      redirect_to current_user
    else
      @user = user
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @edit_privileges = @user == current_user 
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def edit
    if current_user.id != params[:id].to_i
      redirect_to :root
    end
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio)
  end
end
