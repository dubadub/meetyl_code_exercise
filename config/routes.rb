Rails.application.routes.draw do

  root 'pictures#index'

  resources :pictures do
    resources :comments, only: [:index, :create, :destroy]
  end
end
