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
    resources :genres,only: [:index,:create,:edit,:update,:destroy]
    resources :tags,only: [:index,:show,:edit,:update]
    resources :sanctuarys, only: [:index,:show,:edit,:update]
    resources :post_comments, only: [:create]

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
  resources :sanctuarys, only: [:new, :create, :index, :show,:edit, :destroy,:collection] do
    get 'search'
    resources :sanctuary_comments, only: [:create, :destroy]
  end
  resource :favorites, only: [:create, :destroy]
  resources :impression, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update,:quit]

 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end