Rails.application.routes.draw do
  root "pages#browse"
  resources :movies do 
    resources :reviews
  end
  resources :reviews
  
  resources :pages do
    collection do
      get "browse"
      get "search"
      get "about"
  end
end
end
