Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "hello/index" => "hello#index"
  # get "hello/link" => "hello#link"
  # root "hello#index"
  root "tweets#main"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
