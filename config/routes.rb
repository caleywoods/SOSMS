Sosms::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  namespace :user do
    root :to => "contacts#index"
  end

  post 'incoming/text'
  post 'incoming/call'

  #match '/incoming/text' => 'incoming#text', :via => :post
  #match '/incoming/call' => 'incoming#call', :via => :post

  match ':controller(/:action(.:format))'
  match ':controller(/:action(/id(.:format)))'

  resources :contacts
end
