Rails.application.routes.draw do

  get 'homes/top'
  get 'homes/about'
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  root to: 'homes#top'
  get 'about' => 'homes#about'

  namespace :public do
    resources :items, only: [:index, :show]
    resources :carts, only: [:index, :create]
    resources :customers, only: [:index, :show]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end
  resources :items, only: [:index]
  # get 'public/items/index'
  # get 'admin/items/index'
end
