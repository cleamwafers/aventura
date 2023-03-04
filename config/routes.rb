Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
  }
  scope module: :user do
    root 'homes#top'
  end
  namespace :admin do
    # get '/' => '/'
    resources :users,only: [:index,:show,:edit,:update]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :tags,only: [:index,:show,:edit,:update]
    resources :sanctuarys, only: [:index,:show,:edit,:update]
    resources :post_comments, only: [:create]

    end
  end
# ユーザー用
# URL /customers/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

 namespace :user do
  #root to: 'homes#top'
  get 'homes/about'
  resources :sanctuarys, only: [:new, :create, :index, :show,:edit, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :impression, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update,:quit]
  resources :post_comments, only: [:create]

 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end