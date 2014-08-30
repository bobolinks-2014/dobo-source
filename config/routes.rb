Rails.application.routes.draw do
  devise_for :users
  get '/search/:query' => 'search#search', :as => 'search'
  root 'articles#index'
  resources :articles do
  	resources :votes
    resources :comments do
    	resources :votes
  	end
  end
end
