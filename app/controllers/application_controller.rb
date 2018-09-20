class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user, :privileged

    def user_signed_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def privileged
        current_user.admin? || curren_user.instructor?
    end


end
