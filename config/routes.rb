Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root to: "requests#index"
end
