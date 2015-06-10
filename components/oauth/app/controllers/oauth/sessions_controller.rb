module Oauth
  class SessionsController < ApplicationController
    def create
      user = User.find_with_auth_hash(auth_hash)

      if user
        session[:user_id] = user.id
        redirect_to request.env['omniauth.origin'] || raise('Omniauth was unable to save your initial destination.')
      else
        raise 'Authentication unsuccessful, this page _should_ redirect some place'
        #redirect_to '/', alert: 'You are not authorized to perform this action.'
      end
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end