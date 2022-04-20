Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # post '/login', to: 'auth#login'
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
    end
  end
end
