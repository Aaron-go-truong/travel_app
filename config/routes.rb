Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'home/index'
  root 'home#index'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    patch '/users/edit_fullname' => 'users/registrations#update_fullname'
    patch '/users/edit_dateofbirth' => 'users/registrations#update_date_of_birth'
    patch '/users/edit_gender' => 'users/registrations#update_gender'
    patch '/users/edit_address' => 'users/registrations#update_address'
  end

end
