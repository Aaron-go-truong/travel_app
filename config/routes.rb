Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/index'
    post '/users/index_follow'=>'users#follow'
    delete '/users/index_unfollow'=>'users#unfollow'
    get '/users/sign_out' => 'devise/sessions#destroy'
    patch '/users/edit_profile' => 'users/registrations#update_profile'
  end
  root 'home#index'
  get 'home/index'
end
