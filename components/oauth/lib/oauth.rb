require 'user_data'
require 'omniauth'
require 'omniauth-google-oauth2'

module Oauth
  raise "Please add ENV variables for GOOGLE_CLIENT_ID & GOOGLE_CLIENT_SECRET." unless ENV["RAILS_ENV"] == 'test' || (ENV['GOOGLE_CLIENT_ID'] && ENV['GOOGLE_CLIENT_SECRET'])

  require 'oauth/engine'
end
