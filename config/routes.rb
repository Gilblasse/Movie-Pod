Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
# Home Page
root to: 'statics#home'

# Sessions
get '/signup' => "sessions#signup_form", as: 'signup'
post '/signup' => "sessions#create"
get '/login' => "sessions#login_form", as:"login"
post '/login' => "sessions#login"
delete '/logout' => "sessions#destroy"
get '/auth/:provider/callback' => 'sessions#ominauth'


# Host
get '/hosts/:id' => "hosts#show", as: 'host'
resources :hosts do
  resources :properties
end


# USERS
resources :users


# PROPERTIES
resources :properties




end
