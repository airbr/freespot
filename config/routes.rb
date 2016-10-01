Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'home', to: 'static_pages#home', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
