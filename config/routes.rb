Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => {:registrations => "registrations"}
  get '/search', to: 'search_email#index'
  root 'search_email#index'
  get '/welcome', to: 'search_email#welcome_email'

  get '/searching_history', to: 'history_search_emails#index'

  get '/email_campaigns/new', to: 'email_campaigns#new'
  post '/email_campaigns', to: 'email_campaigns#create'
  get '/email_campaigns', to: 'email_campaigns#index'
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
