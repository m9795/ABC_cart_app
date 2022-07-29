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
    resources :carts, only: [:index, :create, :destroy] do
      collection do
        delete 'destory_all' => 'carts#destory_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm' => 'orders#confirm'
        get 'complete' => 'orders#complete'
      end
    end
    get 'sipping_addresses/index'
    get 'sipping_addresses/edit'
    post 'sipping_addresses/index' => 'sipping_addresses#create'
    
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/out_check' => 'customers#out_check'
    patch 'customers/out' => 'customers#out'
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  resources :items, only: [:index]
  # get 'public/items/index'
  # get 'admin/items/index'
end
