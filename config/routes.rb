Rails.application.routes.draw do
  root to: "emails#index", as: "home"

  resources :emails

end
