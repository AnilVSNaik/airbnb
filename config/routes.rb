Rails.application.routes.draw do
  
  get 'braintree/new'
  get 'welcome/index' => "welcome#index"
  resources :listings do 
    resources :reservations, only: [:create]
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post "/users" => "users#create"
  
  get "/listings/:id/reservation/new" => "reservations#new", as: "reservations_new"
  post "/listings/:id/reservation/new" => "reservations#create"
  post 'braintree/checkout'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
end
