Rails.application.routes.draw do
  mount UserAdminUi::Engine => "/user_admin"
  mount Oauth::Engine => "/"
end
