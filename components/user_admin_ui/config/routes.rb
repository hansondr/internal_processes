UserAdminUi::Engine.routes.draw do
  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :companies, only: [:index, :new, :create, :edit, :update]
  resources :departments, only: [:index, :new, :create, :edit, :update]
end
