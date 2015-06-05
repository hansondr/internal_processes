Rails.application.routes.draw do
  mount UserAdminUi::Engine, at: '/user_admin'
end
