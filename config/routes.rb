Rails.application.routes.draw do
  resources :tweets do 
    post'likes', to: 'tweets#likes'
    post'retweet', to: 'tweets#retweet'
  end
  devise_for :users
  get 'home/index'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
