Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
  end
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
    resources :customers, only: [:index, :show] do
      resources :carts, only: [:index, :create]
    end
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end
  resources :items, only: [:index]
  # get 'public/items/index'
  # get 'admin/items/index'
end
