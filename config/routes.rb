 Rails.application.routes.draw do
     devise_for :users
    root to: 'homes#top'

    get 'home/about' => 'homes#about'
    resources :users,only: [:show,:index,:edit,:update] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :books,only: [:new, :create, :index, :show, :destroy, :update, :edit] do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
    end

    get 'search' => 'searche#search', as: 'search'

 end