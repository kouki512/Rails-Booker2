Rails.application.routes.draw do
 root to:'homes#top'
  devise_for :users
  resources :books
  resources :users
  get 'home/about' => 'homes#about'
  get 'users/home/about' => 'homes#about'
  post 'books/:id/edit' => 'books#update'
  post 'users/:id/edit' => 'users#update'
  
end
