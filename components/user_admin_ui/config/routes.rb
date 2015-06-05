UserAdminUi::Engine.routes.draw do
  resources :users, only: [:index, :new, :create, :edit, :update]
end
