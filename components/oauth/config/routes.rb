Oauth::Engine.routes.draw do
  get '/auth/google/callback', to: 'sessions#create'
end
