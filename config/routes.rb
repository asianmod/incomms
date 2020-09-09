Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  post 'trading_logs/comment', to: 'trading_logs#comment'
  post 'trading_logs/confirm', to: 'trading_logs#confirm'
  post 'trading_logs/cancel', to: 'trading_logs#cancel'
  post 'trading_logs/buying', to: 'trading_logs#buying'
  post 'products/comment', to: 'products#comment'
  get 'products/search', to: 'products#search'
  resources :products 
  resources :profiles
  resources :trading_logs, only: [:index, :show]
end
