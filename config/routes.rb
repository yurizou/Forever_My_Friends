Rails.application.routes.draw do
  root to: 'public/homes#top'
  get "search" => "searches#search"
  devise_for :admins, skip: [:registrations, :passwords]  ,controllers: {
    sessions: "admin/sessions"
  }

  #get 'maps/index'
  #root to: 'maps#index'
  #resources :maps, only: [:index]

#  devise_for :users,skip: [:passwords], controllers: {
#    registrations: "public/registrations",
#    sessions: "public/sessions"
#  }
  devise_for :users, skip: [:registrations, :passwords], controllers: {
    sessions: "public/sessions"
  }

  devise_scope :user do
    get '/users/sign_up' => 'public/registrations#new', as: 'new_user_registration'
    post '/users' => 'public/registrations#create', as: 'user_registration'
  end

  scope module: :public do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :friends
    resources :plans
    get 'users/my_page' => 'users#show'
    get 'users/edit' => 'users#edit'
    get 'users/confirm' => 'users#confirm'
    patch 'users/info' => 'users#update'
    patch 'users/quit' => 'users#quit'
    get 'plans/:id/get' => 'plans#plan_get'
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :topics
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
