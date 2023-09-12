Rails.application.routes.draw do
  resources :parking_slots, only: [:index] do
    collection do
      get 'occupied'
      get 'vacant'
    end
  end
  resources :parking_transactions, only: [:index]
  resources :vehicles, only: [:index, :create, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
