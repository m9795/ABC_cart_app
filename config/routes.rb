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
  resources :items, only: [:index]
  namespace :public do
    resources :items, only: [:index]
    resources :customers, only: [:index, :show]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end
  # get 'public/items/index'
  # get 'admin/items/index'
end
