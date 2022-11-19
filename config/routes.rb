Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :posts, only: %i[index show]
  resources :tickets, only: %i[index show]
  resources :galleries, only: :index
  scope :reservations do
    get '/', to: 'reserved_tickets#new', as: 'new_reservation'
    post '/:ticket_id', to: 'reserved_tickets#create', as: 'create_reservation'
  end
  namespace :admin do
    resources :dashboard, only: :index
    resources :posts
    resources :tickets
    resources :galleries
  end

  # Devise routes
  devise_for(:users,
             controllers: { sessions: 'sessions', registrations: 'registrations' },
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' })
end
