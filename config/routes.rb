Rails.application.routes.draw do


  resource :sessions,only:[:new,:create,:destroy]

  get "users/sign_up" => "users#new", as: :sign_up
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "admin_user/:id" => "users#make_admin", as: :admin_user
  get "admin_dismiss/:id" => "users#dismiss_admin", as: :admin_dismiss
  root "movies#index"
  get "movies/hit_movies" => "movies/hit_movies", as: :hit_movies

  # get "movies/new" => "movies#new"
  get "movies/:id/remove" => "movies#destroy", as: :movies_distroy
  resources :movies do
    resources :reviews
  end

  # post "movies" => "movies#create"
  # get "movies" => "movies#index"
  # get "movies/:id" =>"movies#view"
  # root "movies#index"
  # get "movies/:id/edit" => "movies#edit", as: :edit
  # patch "movies/:id" =>"movies#update", as: :movie

end
