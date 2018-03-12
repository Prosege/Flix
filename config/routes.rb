Rails.application.routes.draw do

  resources :genres
  resource :session
  resources :users
  get 'signup' => 'users#new'
  root "movies#index"

  get 'movies/:scope' => "movies#index",
    constraints: { scope: /hits|flops|upcoming|recent/ }, as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
