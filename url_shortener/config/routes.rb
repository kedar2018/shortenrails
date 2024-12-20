Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
   root 'urls#new'

  resources :urls, only: [:new, :create, :show]
  get ':short_url', to: 'urls#redirect', as: :short


namespace :api do
  resources :urls, only: :create
end

  # Defines the root path route ("/")
  # root "posts#index"
end
=begin
  
 curl -X POST http://localhost:3000/api/urls \
-H "Authorization: 2f55448b9f5617eacfc49a4f10e1681d800270b0" \
-H "Content-Type: application/json" \
-d '{"original_url": "https://example.com"}'


=end