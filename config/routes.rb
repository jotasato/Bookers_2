Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  #get 'users/edit'
  #get 'user/show'
  # get 'books/show'
  # get 'books/index'
  # get 'books/new'
  # get 'books/edit'

  get 'home/about' => 'tops#about'

  devise_for :users

  resources :books

  resources :users

root "tops#home"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
