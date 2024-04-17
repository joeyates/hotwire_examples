Rails.application.routes.draw do
  root "home#show"

  namespace :graceful do
    resources :todos
  end

  namespace :pure do
    resources :todos
  end
end
