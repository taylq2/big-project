Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :sellers do
      root "dashboard#index"
    end
  end
end
