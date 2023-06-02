Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'home/index'
  root 'home#index'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    patch '/users/edit_fullname' => 'devise/registrations#update_fullname'
  end

end
