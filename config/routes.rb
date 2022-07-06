Rails.application.routes.draw do


  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # resources :homes, only: [:top, :about]
  # resources :items, only: [:index, :create]
  get 'items/index'
  get 'homes/top'
  get 'homes/about'
  get 'public/items/index'
end
