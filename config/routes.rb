Rails.application.routes.draw do


  root "tweets#index"
  get "/user/login", to: "sessions#new"
  post "/user/login", to: "sessions#create"
  delete "/user/logout", to: "sessions#destroy"
  get "/user/signup", to: "sessions#entry"
  post "/user/signup", to: "sessions#setup"
  get "/tweet/new", to: "tweets#new"
  post "/tweet/new", to: "tweets#create"
  post "/comment", to:"comments#create"


  get "/userpage/:id", to: "relationships#account", as: "accountpage"
  post "/userpage/follow", to: "relationships#create"
  get "/commentpage/:id", to:"tweets#comments", as: "commentpage"

  post "/commentpage/:tweet_id", to:"comments#create"

  get "/relationship/followlist", to:"relationships#followlist"

  resources :user, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only:[:create, :destroy]
  end
end
