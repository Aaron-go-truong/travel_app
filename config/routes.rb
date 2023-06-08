Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/index'
    get 'users/index/:id', to: "users#show"
    post '/users/index_follow', to:'users#follow'
    delete '/users/index_unfollow', to:'users#unfollow'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    patch '/users/edit_profile', to: 'users/registrations#update_profile'
  end
  root 'home#index'
  get 'home/index'
end
