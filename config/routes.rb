Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index' #rootパスをindex画面に設定
  resources :items do
    resources :orders
  end
  # get 'items/new/:id', to: 'items#calculation'
end
