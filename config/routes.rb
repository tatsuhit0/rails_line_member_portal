Rails.application.routes.draw do
  mount_devise_token_auth_for 'Account',
                              at: 'accounts',
                              controllers: {
                                registrations: 'accounts/registrations',
                                sessions: 'accounts/sessions'
                              }
  resources :members
  resources :stores
  namespace :setting do
    resources :line_messaging_api_settings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
