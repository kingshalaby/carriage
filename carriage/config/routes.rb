Rails.application.routes.draw do
  root 'real_estates#index'
  resources :real_estates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
