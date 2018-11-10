Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :reservations do
      member do
        patch :approve, :refuse, :cancel, :arrive, :leave
      end
    end
    resources :room_types
    resources :rooms
    resources :rates
  end

  root 'rooms#index'

  resources :reservations do
    collection do
      get :search
    end
  end
  resources :room_types
  resources :rooms do
    member do
      post :prev, :next, :calc
    end
  end

end
