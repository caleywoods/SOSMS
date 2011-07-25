Sosms::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  post 'incoming/text'
  post 'incoming/call'

  resources :contacts
end
