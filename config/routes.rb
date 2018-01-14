Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
      sessions: 'admin/sessions',
      passwords: 'admin/passwords'
  }
  devise_for :users, path: 'user', controllers: { sessions: 'user/sessions',
                                                            passwords: 'user/passwords',
                                                            registrations: 'user/registrations'
                                                          }
  namespace :user, url: '/' do
    get '/search', to: 'search_email#index'
    get '/welcome', to: 'search_email#welcome_email'
    get '/searching_history', to: 'history_search_emails#index'
    get '/download-file', to: 'search_email#download'
    resources :email_campaigns, only: [:new, :create, :show, :index ]
    root to: 'search_email#index'
  end
  namespace :admin, url: '/admin' do
    resources :user, only: [:index, :destroy, :update]
    get '/edit_profile', to: "admin#edit_profile"
    post '/edit_profile', to: "admin#update_info"
    root to: 'user#index'
  end
  root to: 'user/search_email#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
