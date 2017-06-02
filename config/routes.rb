Rails.application.routes.draw do
  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end
    
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'vote#down_vote', as: :down_vote
  end
  resources :users, only: [:new, :create]
    
  resources :sessions, only: [:new, :create, :destroy]
    
  post 'users/confirm' => 'users#confirm'
    
  get 'about' => 'welcome#about'

  root 'welcome#index'
    
end