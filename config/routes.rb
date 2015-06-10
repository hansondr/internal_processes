Rails.application.routes.draw do
  mount Oauth::Engine, at: '/'
  mount UserAdminUi::Engine, at: '/user_admin'
end