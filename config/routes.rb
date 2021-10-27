Rails.application.routes.draw do
  resources :users

   get 'typeheads/search', to: 'users#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
