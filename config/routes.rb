Sosms::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  namespace :user do
    root :to => "contacts#index"
  end

  post 'incoming/text'
  post 'incoming/call'

  resources :contacts
end
