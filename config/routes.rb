Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, controllers: { sessions: 'sessions', registrations: "users" }
    namespace :sellers do
      root "dashboard#index"
    end
  end
end
