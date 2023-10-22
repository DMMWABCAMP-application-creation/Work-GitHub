Rails.application.routes.draw do
  
  namespace :admin do
    root to: 'homes#top'
    get 'orders/show'
    resources :customers, only: [:index, :show, :edit]
    resources :items, only: [:index, :new, :show, :edit]
  end
  
  scope module: :public do
    root to: "homes#top"
    get 'home/about' => 'homes#about', as: 'about'
    resources :cart_items, only: [:index]
    resources :orders, only: [:new, :index, :show]
    post 'orders/confilm'
    get 'orders/complete'
    resources :customers, only: [:edit]
    get 'customers/show' => 'customers#show', as: 'my_page'
    get 'cuttomers/confilm'
    resources :items, only: [:index, :show]
  end
  
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
