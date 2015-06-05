Rails.application.routes.draw do
  mount UserAdminUi::Engine => "/user_admin"
end
