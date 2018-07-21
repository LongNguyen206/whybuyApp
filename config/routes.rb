Rails.application.routes.draw do
  devise_for :admins
  
  # set an admin home page at 'admin' action, 'home' controller
  authenticated :admin do
    root :to => "home#admin", as: :admin_root
  end

  # do not create users/sessions routes
  devise_for :users, skip: [:sessions]
  as :user do
    # custom path to login/sign_in
    get '/sign_in', to: 'users/sessions#new', as: :new_user_session
    post '/sign_in', to: 'users/sessions#create', as: :user_session
    # custom path to sign_out
    delete '/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  
  # home page for normal users and unauthenticated users
  root "home#page"

  resources :profiles
  # add a custom /profile route to 'show' action in profiles_controller.rb
  get '/profile', to: 'profiles#show', as: :my_profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_my_profile
end
