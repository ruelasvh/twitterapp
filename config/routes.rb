Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'register', to: 'registration#register'
  post 'auth/login', to: 'authentication#authenticate'
  resources :tweets
end
