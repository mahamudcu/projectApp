Rails.application.routes.draw do

  get 'dashboard', to: 'home#dashboard',as: :dashboard
  get '', to: 'home#landing'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#landing"
end
