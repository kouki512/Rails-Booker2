Rails.application.routes.draw do
 root to:'homes#top'
  devise_for :users
  resources :books do 
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  post 'books/:id/edit' => 'books#update'
  
  resources :users
  get 'home/about' => 'homes#about'
  get 'users/home/about' => 'homes#about'
  post 'users/:id/edit' => 'users#update'
  
end
