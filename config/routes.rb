Rails.application.routes.draw do
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
    resources :carts, only: [:index, :create, :destroy]
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'

  end

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end
  resources :items, only: [:index]
  # get 'public/items/index'
  # get 'admin/items/index'
end
