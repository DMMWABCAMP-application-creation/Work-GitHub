Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords],  controllers: {
    sessions: "admins/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions"
  }
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
