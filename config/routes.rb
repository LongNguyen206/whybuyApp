Rails.application.routes.draw do
  resources :profiles

  devise_scope :user do
    # custom path to login/sign_in
    get "/sign_in" => "devise/sessions#new"
    # custom path to sign_up/registration
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" 
  end

  devise_for :users
  root 'home#page'
end
