Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # mount_devise_token_auth_for 'User', at: 'auth'
  get '/search', to: 'search_email#validate_email'
  root 'home#index'
  get '/welcome', to: 'search_email#welcome_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
