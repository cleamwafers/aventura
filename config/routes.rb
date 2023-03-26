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
    resources :users,only: [:index,:show,:edit,:update,:destroy
    ]
    resources :genres,only: [:index,:create,:edit,:update,:destroy]
    resources :tags,only: [:index,:show,:edit,:update]
    resources :sanctuarys, only: [:index, :show, :destroy] do
      resources :sanctuary_comments, only: [:destroy]
    end

    end
# ユーザー用
# URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

get 'search', to: 'searches#search'

 namespace :user do
  #root to: 'homes#top'
  get 'homes/about'
  resources :sanctuarys, only: [:new, :create, :index, :show,:edit, :destroy,:collection] do
    resources :sanctuary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :impression, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]
  get 'quit', to: 'users#quit'
  patch 'out', to: 'users#out'

 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end