Rails.application.routes.draw do
  root 'pages#index'
  resources :items, except: [:new, :edit]
end
