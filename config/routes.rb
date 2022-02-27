Rails.application.routes.draw do
  mount_devise_token_auth_for 'Account',
                              at: 'accounts',
                              controllers: {
                                registrations: 'accounts/registrations',
                                sessions: 'accounts/sessions'
                              }
  resources :members
  resources :stores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
