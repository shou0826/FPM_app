Rails.application.routes.draw do

  get 'rooms/:id' => 'rooms#show'
  post 'rooms/:id/create' => 'rooms#create'
  get 'rooms/:id/index' => 'rooms#index'


  get 'public/index' => 'public#index'
  get 'public/new' => 'public#new'
  post 'public/create' => 'public#create'
  get 'public/:id' => 'public#show'
  get 'public/:id/edit' => 'public#edit'
  post 'public/:id/update' => 'public#update'
  post 'public/:id/destroy' => 'public#destroy'


  get 'users/index' => 'users#index'
  get 'users/player_index' => 'users#player_index'
  get 'users/mypage' => 'users#mypage'
  get 'users/signup' => 'users#signup'
  post 'users/create' => 'users#create'
  get 'users/:id/new' => 'users#new'
  post 'users/:id/create_content' => 'users#create_content'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/edit_content' => 'users#edit_content'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/update_content' => 'users#update_content'
  post 'users/:id/destroy' => 'users#destroy'

  post 'likes/:id/create' => 'likes#create'
  post 'likes/:id/destroy' => 'likes#destroy'

  get '/' => 'tops#top_index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
