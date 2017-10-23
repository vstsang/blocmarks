Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, except: [:index, :show] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  post :incoming, to: 'incoming#create'

  get 'likes/index'

  root 'welcome#index'
end
