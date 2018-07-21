Rails.application.routes.draw do
  devise_for :admins
  
  devise_for :users, skip: [:sessions]
  as :user do
    # custom path to login/sign_in
    get '/sign_in', to: 'users/sessions#new', as: :new_user_session
    post '/sign_in', to: 'users/sessions#create', as: :user_session
    # custom path to sign_out
    delete '/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  
  root 'home#page'
  get 'admin', to: 'home#admin', as: :admin_home
  resources :profiles
end
