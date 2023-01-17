Rails.application.routes.draw do


  root to: "pages#home"

  get 'bookmarks/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "lists#index"

  resources :movies, only: [:index, :show]

  resources :lists, except: [:destroy, :update] do
    resources :bookmarks
  end
end
