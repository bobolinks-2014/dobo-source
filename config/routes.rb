Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
  	resources :votes
   #  resources :comments do
   #  	resources :votes
  	# end
  end
end
