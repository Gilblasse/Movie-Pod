Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
# Home Page
root to: 'statics#home'

# Sessions
get '/signup' => "sessions#new", as: 'signup'
post '/signup' => "sessions#create"
get '/login' => "sessions#login_form"
post '/login' => "sessions#login"
delete '/logout' => "sessions#destroy"


# Host




# USERS
resources :users


# PROPERTIES
resources :properties




end
