Rails.application.routes.draw do
  root "pages#browse"
  resources :movies do 
    resources :reviews
  end
  resources :reviews
  get "/about", to: "pages#about"
  get "/search", to: "pages#search"

end
