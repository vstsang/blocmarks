Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index, :show]
  end

  get 'incoming_controller/create'

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
