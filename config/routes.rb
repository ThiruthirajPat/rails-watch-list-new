Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create, :destroy] do 
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  
  resources :bookmarks, only: [ :destroy]
  resources :reviews, only: [ :destroy]
  resources :movies, only: [:index, :show, :new, :create]

end
