module Oauth
  module ApplicationHelper
    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to '/'
    end

    def current_user
      begin
        @current_user ||= UserData::User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil
      end
    end

    def signed_in?
      current_user
    end

    def require_login
      redirect_to "/auth/google?origin=#{request.original_url}" unless signed_in?
    end
  end
end
