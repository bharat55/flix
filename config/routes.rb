Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "movies#index"
  get "movies/hit_movies" => "movies/hit_movies", as: :hit_movies

  # get "movies/new" => "movies#new"
  get "movies/:id/remove" => "movies#destroy", as: :movies_distroy
  resources :movies
  # post "movies" => "movies#create"
  # get "movies" => "movies#index"
  # get "movies/:id" =>"movies#view"
  # root "movies#index"
  # get "movies/:id/edit" => "movies#edit", as: :edit
  # patch "movies/:id" =>"movies#update", as: :movie

end
