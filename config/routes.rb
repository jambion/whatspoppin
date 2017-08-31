Rails.application.routes.draw do
  root "pages#browse"
  resources :movies do 
    resources :reviews
  end
  resources :reviews

  get "/pages/:page" => "pages#show"
end
