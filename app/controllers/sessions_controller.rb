class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      # binding.pry
      u.password = (auth['uid'].to_i * Time.new.usec).to_s
      u.student!
    end
  
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
  
  private
  
  def auth
    request.env['omniauth.auth']
  end
end


