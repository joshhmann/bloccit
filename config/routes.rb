Rails.application.routes.draw do
    resources :topics do
        resources :posts, except: [:index]
    end
    
    resources :posts, only: [] do
        
    resources :users, only: [:new, :create]
    
      resources :comments, only: [:create, :destroy]
    end
    
    
    resources :sessions, only: [:new, :create, :destroy]
    
    post 'users/confirm' => 'users#confirm'
    
    get 'about' => 'welcome#about'

    root 'welcome#index'
    
end