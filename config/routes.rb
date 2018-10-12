Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rooms#index'
  resources :reservations do
    new do
      match 'apply', via: [:get, :post]
      post 'confirm'
    end
  end
  resources :room_types
  resources :rooms do
    member do
      post :prev, :next, :calc
    end
  end

end
