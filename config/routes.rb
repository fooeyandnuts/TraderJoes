TraderJoes::Application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :index]
  resources :lists, only: [:index, :new, :create, :show, :edit, :destroy]
  resources :items

  root 'users#index'

end
