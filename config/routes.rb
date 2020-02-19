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
get '/logout' => "sessions#destroy"
get '/auth/:provider/callback' => 'sessions#ominauth'


resources :users do 
  resources :movies, only: [:new,:create,:edit,:update,:destroy]
end

resources :movies, only: [:index, :show] do 
  resources :reviews, only: [:new, :create]
end



%w( 404 422 500 503 ).each do |code|
  get code  => "static#error", :code => code
end

end
