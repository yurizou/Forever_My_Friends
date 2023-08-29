Rails.application.routes.draw do
     root to: 'public/homes#top'
   scope module: :public do
      resources :genres, only: [:index, :create, :edit, :update]
      resources :friends
      resources :plans
      get 'users/my_page' => 'users#show'
      get 'users/edit' => 'users#edit'
      get 'users/confirm' => 'users#confirm'
      patch 'users/info' => 'users#update'
      patch 'users/quit' => 'users#quit'

   end

  namespace :admin do
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
