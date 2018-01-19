Rails.application.routes.draw do
#  RESTリソースへの標準的なルーティング
#  articleの内側にネストされたリソースとしてcommentsが作成される
  resources :articles do
    resources :comments
  end

#  root
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
