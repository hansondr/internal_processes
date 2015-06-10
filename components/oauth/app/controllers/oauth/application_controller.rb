module Oauth
  class ApplicationController < ActionController::Base
    include ApplicationHelper

    protect_from_forgery with: :null_session
    helper_method :current_user, :signed_in?, :require_login
  end
end
