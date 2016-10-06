Rails.application.routes.draw do

  #Static pages
  root to: 'static_pages#city'
  get 'home', to: 'static_pages#city', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'city', to: 'static_pages#city', as: 'city'

  #Devise
  devise_for :users
  get 'city', to: 'static_pages#city', as: :user_root

  #Spots
  resources :spots

  #comments
  resources :comments

  resources :spots do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
