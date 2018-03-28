Rails.application.routes.draw do
  root "books#index"

  get "static_pages/home"
  get "static_pages/help"
  resources :books
end
