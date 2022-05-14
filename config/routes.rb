Rails.application.routes.draw do
  resources :challenges
  get 'welcome/index'
  get 'profile', to: 'users#edit'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'search', to: 'articles#search'
  get 'like_article', to: 'articles#like'
  root 'welcome#index'
  resources :users
  resources :articles do
    resources :comments
  end
  resources :books do
    resources :reviews
  end

  resources :courses do
    resources :topics do
      resources :challenges do
        get 'challenge_submit', to: 'challenges#challenge_submit'
      end
    end 
  end

end
