Rails.application.routes.draw do

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books do
    resources :post_comments, only: [:create, :destroy, :edit, :update]
    resources :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

end
