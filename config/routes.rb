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
  get "/signup", to: "sessions#entry"
  post "/signup", to: "sessions#setup"
  get "/new", to: "tweets#newp"
  post "/new", to: "tweets#add"
  post "/comment", to:"comments#create"

  #  "/userpage", to: "relationships#user_page"
  get "/userpage/:id", to: "relationships#account", as: "accountpage"
  post "/userpage/follow", to: "relationships#create"
  get "/commentpage/:id", to:"tweets#comments", as: "commentpage"

  post "/commentpage/comment", to:"comments#create"

  resources :account_table, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only:[:create, :destroy]
  end
end
