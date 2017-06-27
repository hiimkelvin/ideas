Rails.application.routes.draw do

  root 'users#new'

  get 'main' => 'users#new'
  get 'users/new' => 'users#new'
  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'

  get 'sessions' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  get 'bright_ideas' => 'posts#index'
  get 'bright_ideas/:id' => 'posts#show'
  post 'posts' => 'posts#create'
  delete 'posts/:id' => 'posts#destroy'

  post 'likes' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'


end
