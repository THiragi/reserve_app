Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rooms#index'
  resources :reservations
  resources :room_types
  resources :rooms
  post 'rooms/prev', to: 'rooms#prev', as: 'rooms_prev'
  post 'rooms/next', to: 'rooms#next', as: 'rooms_next'
end
