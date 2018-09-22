class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = auth['uid'] # gives user a password so it passes validations. fix this.
      u.student!
    end
  
    session[:user_id] = @user.id
    binding.pry
    redirect_to user_path(@user)
  end
  
  private
  
  def auth
    request.env['omniauth.auth']
  end
end


