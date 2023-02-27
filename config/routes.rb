Rails.application.routes.draw do
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/quit'
  end
  namespace :user do
    get 'sanctuarys/index'
    get 'sanctuarys/show'
    get 'sanctuarys/edit'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'sanctuarys/index'
    get 'sanctuarys/show'
  end
  namespace :admin do
    get '/root' =>'homes#top'
  end
# ユーザー用
# URL /customers/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions',
  root to: 'homes#top',
  resources :sanctuarys, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :impression, only: [:create, :destroy]
end
 resources :users, only: [:show, :edit, :update]
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
