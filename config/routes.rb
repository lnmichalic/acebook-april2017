Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :likes
  resources :posts

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/users#new"
    get '/posts' => 'clearance/users#new'
  end

  resources :users, controller: 'users', only: 'create'

  constraints Clearance::Constraints::SignedIn.new do
    root to: "posts#index", as: :signed_in_root
    resources :posts
  end

end
