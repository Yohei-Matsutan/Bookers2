Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  # なんとなくusersとbooksのネストはしないurl長くなるし
  resources :users, only: [:index, :show]

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
end
