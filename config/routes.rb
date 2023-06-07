Rails.application.routes.draw do
  get 'list_users/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'home/index'
  root 'home#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    patch '/users/edit_profile' => 'users/registrations#update_profile'
  end

end
