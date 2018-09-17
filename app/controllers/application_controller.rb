class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user=, :current_user

    def user_signed_in?
        !!session[:user_id]
    end

    def current_user=(user_object)
        session[:user_id] = user_object.id
    end

    def current_user
        User.find(session[:user_id])
    end

end
