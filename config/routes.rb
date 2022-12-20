Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#welcome', as: :authenticated_root
    end

    unauthenticated do
      root 'home#welcome', as: :unauthenticated_root
    end
  end

  resources :categories
  resources :expenses, only: [:new, :create, :destroy]

end
