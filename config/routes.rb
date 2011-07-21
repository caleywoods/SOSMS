Sosms::Application.routes.draw do
  root :to => "home#index"

  resources :contacts
end
