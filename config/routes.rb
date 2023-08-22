Rails.application.routes.draw do
  
  namespace :public do
    get 'homes/top'
  end
  root to: 'homes#top'
  
  
  devise_for :admins, skip: [:registrations, :passwords]  ,controllers: {
    sessions: "admin/sessions"
  }


  devise_for :users,skip: [:passwords], controllers: {
    
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
