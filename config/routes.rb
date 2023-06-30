Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users', to: 'users#index'
    get '/users/:id', to: "users#show"
    post '/users/index_follow', to:'users#follow'
    delete '/users/index_unfollow', to:'users#unfollow'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    patch '/users/edit_profile', to: 'users/registrations#update'
  end

  resources :plans do
    resources :comments
  end

  post '/like_new', to:'likes#create'
  delete '/like_destroy', to:'likes#destroy'

  patch '/notification_read', to:'notifications#update'
  patch '/notification_read_all', to:'notifications#mark_all_as_read'

  root 'home#index'
  get 'home/index', to: 'plan#index'

  mount ActionCable.server => '/cable'

end
