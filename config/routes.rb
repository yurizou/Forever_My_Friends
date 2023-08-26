Rails.application.routes.draw do

   namespace :public do
      root to: 'homes#top'
      resources :genres, only: [:index, :create, :edit, :update]
      resources :friends
      resources :plans
      get 'users/my_page' => 'userss#show'
      get 'users/edit' => 'uers#edit'
      get 'users/confirm' => 'users#confirm'
      patch 'users/info' => 'users#update'
      patch 'users/quit' => 'users#quit'
      
   end
  
  namespace :admin do
     root to: 'homes#top'
     resources :topics
    
  end



  devise_for :admins, skip: [:registrations, :passwords]  ,controllers: {
    sessions: "admin/sessions"
  }


  devise_for :users,skip: [:passwords], controllers: {

    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
