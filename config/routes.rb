Rails.application.routes.draw do
  scope :v1, defaults: { format: :json } do
    devise_for :users
  end
  namespace :v1, defaults: { format: :json } do
    resources :doctors
    resources :appointments
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
