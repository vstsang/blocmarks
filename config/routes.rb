Rails.application.routes.draw do
  get 'likes/index'

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index, :show]
  end

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
