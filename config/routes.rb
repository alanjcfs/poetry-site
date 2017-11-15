Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :admin do
    resources :poems, except: :destroy
  end

  resources :poems, only: [:index, :show] do
    get 'random', on: :collection
  end

  root to: 'poems#index'
end
