Rails.application.routes.draw do
  root "home#show"

  namespace :pure do
    resources :todos
  end
end
