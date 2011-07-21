Sosms::Application.routes.draw do
  root :to => "welcome#index"

  resources :contacts
end
