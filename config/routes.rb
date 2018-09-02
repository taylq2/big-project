Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, controllers: { sessions: 'sessions', registrations: "users" }
    get "/pages/*page" => "pages#show"
    root "pages#show", page: "home"

    namespace :sellers do
      root "dashboard#index"
      resources :products, only: [:index, :show, :new, :create]
    end

    namespace :buyers do
      resources :orders
      resources :carts
      resources :products do
        resources :order_details, only: :create
      end
      resources :order_details, only: %i(show destroy edit update)
    end
  end
end
