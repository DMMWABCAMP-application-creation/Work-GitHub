Rails.application.routes.draw do
  
  namespace :admin do
    root to: 'homes#top'
    get 'orders/show'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: "homes#top"
    get 'home/about' => 'homes#about', as: 'about'
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :create, :edit, :update, :destroy]
    # delete 'cart_items/destroy'
    resources :orders, only: [:new, :index, :show]
    post 'orders/confilm'
    get 'orders/complete'
    patch 'customers/quit'
    resources :customers, only: [:edit, :update]
    get 'customers/edit' => 'customers#edit', as: 'customers/information/edit'
    get 'customers/show' => 'customers#show', as: 'my_page'
    get 'customers/confilm'
    
    resources :items, only: [:index, :show, :create]
  end
  
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
