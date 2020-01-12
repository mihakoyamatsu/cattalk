Rails.application.routes.draw do
  
  root 'user/posts#index'
  devise_for :admins, path: 'auth', path_names: { sign_in: 'panda_and_coffee_with_ryoko_play_login', sign_out: 'panda_and_coffee_with_ryoko_play_logout', password: 'panda_and_coffee_with_ryoko_play_secret', confirmation: 'panda_and_coffee_with_ryoko_play_verification', unlock: 'panda_and_coffee_with_ryoko_play_unblock', registration: 'panda_and_coffee_with_ryoko_play_register', sign_up: 'panda_and_coffee_with_ryoko_play_cmon_let_me_in' }, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  namespace :admin do
    resources :users, only: [:index, :show]
    put 'users/:id/hide' => 'users#hide', as: 'users_hide'
    resources :post_reports, only: [:index, :show]
    put 'post_reports/:id/hide' => 'post_reports#hide', as: 'post_reports_hide'
    resources :user_reports, only: [:index, :show]
    put 'user_reports/:id/hide' => 'user_reports#hide', as: 'user_reports_hide'
    resources :rooms, only: [:index, :show]
    put 'rooms/:id/hide' => 'rooms#hide', as: 'rooms_hide'
  end

  namespace :user do
    get 'homes/about' => "homes#about"
    resources :posts, only: [:create, :index, :new, :show ] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
      resources :post_reports, only: [:create]
    end
    put "/posts/:id/hide" => "posts#hide", as: 'posts_hide'
    put "/comments/:id/hide" => "comments#hide", as: 'comments_hide'
    get "/users/favorites" => "users#favorites", as: 'favorites'

    resources :users, only: [:show, :edit ] do
      resources :cats
      resources :reminders
      resources :user_reports, only: [:create]
    end


    resources :rooms, only: [:show, :create]
    put "/rooms/:id/hide" => "rooms#hide", as: 'rooms_hide'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
